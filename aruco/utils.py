import cv2
import numpy as np
from scipy.spatial.transform import Rotation
from dataclasses import dataclass
from VCS import VideoCapture
from djitellopy import Tello

@dataclass
class R_vec:
    pitch: float = 0
    roll: float = 0
    yaw: float = 0

@dataclass()
class T_vec:
    """
    a simple dataclass to handle t vecs
    """
    x: float = 0
    y: float = 0
    z: float = 0


def extract_6_dof(rvec, tvec, origin_marker = True, round_num = None, floor = False):
    """
    extract 6 dof from vecs

    Args:
        rvec (list(int)): rotation rodrigez vec
        tvec (list(int)): translation vec in mm
        origin_marker (bool, optional): sets the return origin - marker or origin. Defaults to True.
        round_num (int, optional): number of digits to round return to. Defaults to None.
        floor (bool, optional) : is a floor marker
        
    Returns:
        tuple(R_vec, T_vec): rotation and translation in degrees and cm
    """
    rmat, _ = cv2.Rodrigues(rvec)
    rmat = np.matrix(rmat)
    if floor:
        mat_rot_floor = np.matrix([[1,0,0],
                                   [0,0,1],
                                   [0,-1,0]])
        rmat = rmat*mat_rot_floor
        
    euler_angles = Rotation.from_matrix(rmat).as_euler("xyz", degrees=True)
    
    if origin_marker:
        tvec = (tvec * -rmat)
        tvec = np.array(tvec[0])[0]
    
    pitch = euler_angles[0]
    if pitch > 0:
        pitch = 180-pitch
    else:
        pitch = -pitch - 180

    yaw = euler_angles[1]
    roll = euler_angles[2]
    
    x,y,z = tvec[0]/10, tvec[2]/10, tvec[1]/10
    
    if floor:
        z *= -1
        y *= -1
        yaw *= -1
    
    R = R_vec(pitch, roll, yaw)
    T = T_vec(x, y, z)
    
    if round_num != None:
        R = R_vec(round(R.pitch, round_num), round(R.roll, round_num), round(R.yaw, round_num))
        T = T_vec(round(T.x, round_num), round(T.y, round_num), round(T.z, round_num))
    return R, T


def stream_tello():
    tello_ip = "192.168.0.20"
    tello_ip = "0.0.0.0"
    status_p, video_p = 8890, 11111
    camera_string = f"udp://{tello_ip}:{video_p}"
    
    calib_path = "/home/fares/rbd/tools/calib/drone20.yaml"
    fs = cv2.FileStorage(calib_path, cv2.FILE_STORAGE_READ)
    CAMERA_MAT = fs.getNode("camera_matrix").mat()
    CAMERA_DIST = fs.getNode("distortion_coefficients").mat()
    A_DICT = cv2.aruco.getPredefinedDictionary(cv2.aruco.DICT_ARUCO_ORIGINAL)
    A_PARAMS = cv2.aruco.DetectorParameters()
    detector = cv2.aruco.ArucoDetector(A_DICT, A_PARAMS)
    
    print (f"CAMERA_MAT: {CAMERA_MAT}")
    print (f"CAMERA_DIST: {CAMERA_DIST}")
    print (f"A_DICT: {A_DICT}")
    print (f"A_PARAMS: {A_PARAMS}")
    
    # init tello
    t1 = Tello()
    t1.connect()
    t1.set_network_ports(status_p, video_p)
    t1.streamon()
    
    
    cap = VideoCapture(camera_string)
    
    while cap._live:
        if cv2.waitKey(50) & 0xFF == ord('q'):
            break
        ret, frame = cap.read()
        if not ret:
            continue
        cv2.imshow("frame", frame)
        markerCorners, markerIds, _ = detector.detectMarkers(frame)

        if markerIds is None:
            continue
        for index, id in enumerate(markerIds):
            id = id[0]
            if id != 52:
                continue
            rvecs, tvecs, _ = cv2.aruco.estimatePoseSingleMarkers(markerCorners[index], 70, CAMERA_MAT, CAMERA_DIST)
            r,t = extract_6_dof(rvecs[0][0], tvecs[0][0], origin_marker=True, round_num=1, floor=False)
            print (f"{id}: {r}, {t}")
        

if __name__ == "__main__":
    stream_tello()