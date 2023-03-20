import cv2
from time import sleep
from sys import argv
import djitellopy

def main():
    
    return_fps = 3
    if len(argv) > 1:
        return_fps = int(argv[1])

    save_path = "/home/fares/rbd/tools/Tools-backups/camera calibration/tello_frame_collection/images/"
    if len(argv) > 2:
        save_path = argv[2]
    
    cap_string = "udp://0.0.0.0:11111?overrun_nonfatal=1&fifo_size=5000"
    if len(argv) > 3:
        if argv[3] in [f"{i}" for i in range (10)]:
            cap_string = int(argv[3])
        else:
            cap_string = argv[3]
    else:
        t1 = djitellopy.Tello()
        t1.connect()
        t1.streamon()
        
    # Create a VideoCapture object and read from input file
    cap = cv2.VideoCapture()
    cap.open(cap_string)
    # Check if camera opened successfully
    
    counter = 0
    while (cap.isOpened() == False):
        print("Error opening video stream or file")
        sleep(0.5)
        counter += 1
        if counter > 15:
            exit(1)

    save_rate = int(cap.get(5)//return_fps)
    counter = 0
    name_counter = 0
    faq = 0
    
    # Read until video is completed 
    while (cap.isOpened()):
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
