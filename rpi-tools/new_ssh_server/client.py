import socket
import time

def get_ip_address():
    try:
        # Create a socket object to get the local machine's IP address
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip_address = s.getsockname()[0]
        s.close()
        return ip_address
    except Exception as e:
        return str(e)

def broadcast_ip_address(ip_address, broadcast_port):
    try:
        # Create a UDP socket
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

        # Broadcast the IP address
        message = ip_address.encode('utf-8')
        sock.sendto(message, ('<broadcast>', broadcast_port))
        
        print(f'Broadcasted IP address {ip_address} to the network.')
        sock.close()
    except Exception as e:
        print(f'Error broadcasting IP address: {str(e)}')

if __name__ == '__main__':
    # Replace these values with the desired broadcast port
    broadcast_port = 12345

    # Get the Raspberry Pi's IP address
    ip_address = get_ip_address()

    # Broadcast the IP address
    broadcast_ip_address(ip_address, broadcast_port)

    # Add a delay to ensure the broadcast is sent before exiting
    time.sleep(2)

