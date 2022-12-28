import socket
import sys
import subprocess

session_name = "sshServer"

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

        # bashPath = '/home/fares/rbd/tools/rpi-Tools/ssh_automation/ssh_sshfs.sh'
        # print(bashPath, str(i[1]), dir_path)

        # print ("ip adress: " + i[1])

        # bash_args = [i[1], dir_path]
        # subprocess.run(['bash', bashPath] + bash_args)

def tmux_script_maker(info):
    
    # Open the output file
    with open("tmux_script.sh", "w") as output_file:

        # Write the shebang line
        output_file.write("#!/bin/bash\n\n")
        output_file.write("tmux rename-session " + session_name + "\n")

        first = True
        # Iterate over the number of windows
        for raspberry in info:
            name = raspberry[0]
            ip = str(raspberry[1])
            sshFS_dir = '/home/fares/rbd/tools/rpi-Tools/ssh_automation/sshDirs/' + name
            
            if first:
                output_file.write("tmux rename-window " + name + "\n")
                first = False
            else:
                # Create a new window
                output_file.write("tmux new-window -n Window" + name + "\n")

            #rename pane
            output_file.write("tmux select-pane -T sshFS\n")
            # do sshfs command
            sshFScommand = "sudo sshfs -o allow_other pi@" + ip + ":/home/pi/ " + sshFS_dir + " && cd " + sshFS_dir
            output_file.write("tmux send-keys '" + sshFScommand + "' Enter\n")

            #split
            output_file.write("tmux split-window -h\n")
            #select other pane
            output_file.write("tmux selectp -t 1\n")
            #rename pane
            output_file.write("tmux select-pane -T PI-" + name + "\n")
            #do ssh command
            sshCommand = "sudo ssh pi@" + ip
            output_file.write("tmux send-keys '" + sshCommand + "' Enter\n")

def run_in_new_cmd(command):
    subprocess.run('gnome-terminal -- sh -c "bash -c \"{}; exec bash\""'.format(command), shell=True)


def tmux_win():
    tmux_script_path = '/home/fares/rbd/tools/rpi-Tools/ssh_automation/tmux_script.sh'
    subprocess.run("tmux kill-session -t sshServer", shell=True)
    
    cp = ('/home/fares/rbd/tools/rpi-Tools/ssh_automation/tmux-sendall {} \"\"'.format(session_name))

    subprocess.run('echo {} | xclip -selection clipboard'.format(cp), shell=True)
    #this needs to be the last command
    run_in_new_cmd('tmux && ' + tmux_script_path)

    
def main():
    if len(sys.argv) > 1:
        writeIP(int(sys.argv[1]))

    adresses = readIP()
    info = get_info(adresses)
    dirsshfs(info)
    tmux_script_maker(info)
    tmux_win()






if __name__=="__main__":
    main()
