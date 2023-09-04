import djitellopy
import time

tello_ip = "192.168.0.24"
status_p, video_p = 8890, 11120

t = djitellopy.Tello()
t.connect()
t.set_network_ports(status_p, video_p)
t.streamon()

while True:
    time.sleep(5)