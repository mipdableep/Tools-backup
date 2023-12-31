import socket

def listen_for_broadcast(broadcast_port):
    try:
        # Create a UDP socket
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(('0.0.0.0', broadcast_port))

        print(f'Listening for broadcasts on port {broadcast_port}')

        while True:
            # Receive the broadcasted message
            data, addr = sock.recvfrom(1024)
            ip_address = data.decode('utf-8')

            print(f'Received IP address: {ip_address} from {addr}')
    except Exception as e:
        print(f'Error listening for broadcasts: {str(e)}')
    finally:
        sock.close()

if __name__ == '__main__':
    # Replace these values with the same broadcast port used on the Raspberry Pi
    broadcast_port = 12345

    # Listen for the broadcasted IP address indefinitely
    listen_for_broadcast(broadcast_port)
