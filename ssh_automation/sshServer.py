import socket
import sys
import subprocess

def writeIP(connection_num):
    connection_counter = 0

    # Create a TCP/IP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Bind the socket to the port
    server_address = ('0.0.0.0', 10000)
    print('starting up on {} port {}'.format(*server_address))
    sock.bind(server_address)

    # Listen for incoming connections
    sock.listen(1)
    with open("client_ips.txt", "w") as f:
        while connection_num > connection_counter:
            # Wait for a connection
            print('waiting for a connection')
            connection, client_address = sock.accept()
            try:
                print('connection from', client_address)

                # Receive the data in small chunks and retransmit it
                while True:
                    data = connection.recv(1024)
                    print('received {!r}'.format(data))
                    if data:
                        # Write the client's IP address to a file
                        f.write(data.decode("utf-8") + "---" + str(client_address[0]) + "\n")
                    else:
                        print('no data from', client_address)
                        break

            finally:
                # Clean up the connection
                connection.close()
                connection_counter += 1

def readIP():
    arr = []
    with open("client_ips.txt", "r") as ipRead:
        lines = ipRead.readlines()
        count = 0
        # Strips the newline character
        for line in lines:
            count += 1
            print(line.strip())
            arr.append(line.strip())
    return arr

def get_info(adresses):
    
    arr = []
    for line in adresses:
        nameEnd = str(line).find("---")

        name = line[:nameEnd]
        ipAdress = line[nameEnd + 3:]
        info = []
        info.append(name)
        info.append(ipAdress)
        arr.append(info)
    return arr

def dirsshfs(info):
    path = '/home/fares/rbd/tools/rpi-Tools/ssh_automation/sshDirs/'
    removeDirs = "rm -rf " + path + "*"
    subprocess.run(removeDirs, shell=True)
    
    for i in info:
        dir_path = path + i[0]
        make = "mkdir " + dir_path
        subprocess.run(make, shell=True)

        bashPath = '/home/fares/rbd/tools/rpi-Tools/ssh_automation/ssh_sshfs.sh'
        print(bashPath, str(i[1]), dir_path)

        print ("ip adress: " + i[1])

        bash_args = [i[1], dir_path]
        subprocess.run(['bash', bashPath] + bash_args)


def main():
    writeIP(int(sys.argv[1]))
    adresses = readIP()
    info = get_info(adresses)
    dirsshfs(info)






if __name__=="__main__":
    main()
