import cv2
from time import sleep
import VCS

#! params:
# rate photos are saved (one out of ...)
SAVE_RATE = 10
SAVE_PATH = "/home/ido/Tools/Tools-backup/camera_calibration/calib_from_img_dir/imgs/"
# cap_string = "udp://0.0.0.0:11111?overrun_nonfatal=1&fifo_size=5000"
CAP_STRING = 0
USE_TELLO = False

if USE_TELLO:
    import djitellopy


def main():
    if USE_TELLO:
        t1 = djitellopy.Tello()
        t1.connect()
        t1.streamon()

    # Create a VideoCapture object and read from input file
    cap = cv2.VideoCapture(CAP_STRING)
    # Check if camera opened successfully

    counter = 0
    name_counter = 0

    # Read until video is completed
    while cap.isOpened:
        # Capture frame-by-frame
        ret, frame = cap.read()
        if ret == True:
            cv2.imshow("Frame", frame)

            if counter % SAVE_RATE == 0:
                frame_name = "" + SAVE_PATH + str(name_counter) + ".jpg"
                print(frame_name)
                cv2.imwrite(frame_name, frame)
                name_counter += 1

            counter += 1

            # Press Q on keyboard to  exit
            if cv2.waitKey(25) & 0xFF == ord("q"):
                break

        else:
            sleep(0.2)

    # When everything done, release the video capture object
    cap.release()

    # Closes all the frames
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
