import djitellopy
import time

tello_ip = "192.168.0.20"
status_p, video_p = 8890, 11111

t = djitellopy.Tello()
t.connect()
t.set_network_ports(status_p, video_p)
t.streamon()

while True:
    time.sleep(5)