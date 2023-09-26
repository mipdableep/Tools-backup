import cv2
from time import sleep
import djitellopy
import VCS

#! params:
# rate photos are saved (one out of ...)
save_rate = 10
save_path = "/home/fares/rbd/tools/Tools-backups/camera calibration/tello_frame_collection/images/"
cap_string = "udp://0.0.0.0:11111?overrun_nonfatal=1&fifo_size=5000"
tello = True


def main():
    if tello:
        t1 = djitellopy.Tello()
        t1.connect()
        t1.streamon()
        
    # Create a VideoCapture object and read from input file
    cap = VCS.VideoCapture(cap_string)
    # Check if camera opened successfully
    
    counter = 0
    name_counter = 0
    
    # Read until video is completed 
    while (cap._live):
        # Capture frame-by-frame
        ret, frame = cap.read()
        if ret == True:

            cv2.imshow('Frame', frame)

            if counter % save_rate == 0:
                frame_name = "" + save_path + str(name_counter) + ".jpg"
                print(frame_name)
                cv2.imwrite(frame_name, frame)
                name_counter += 1

            counter += 1

            # Press Q on keyboard to  exit
            if cv2.waitKey(25) & 0xFF == ord('q'):
                break

        else:
            sleep(0.2)

    # When everything done, release the video capture object
    cap.release()

    # Closes all the frames
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
