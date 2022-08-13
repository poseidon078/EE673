import threading
from socket import *

def receive():
    
    serverSocket =socket(AF_INET, SOCK_DGRAM)
    serverPort=12000
    serverSocket.bind(('192.168.29.79', serverPort))
    print('The server is ready to receive at port: ', serverSocket.getsockname())

    while 1:
        message, clientAddress =serverSocket.recvfrom(2048)
        # print('Recieved request from', clientAddress)
        print('Phone:', message.decode('ascii'))

def send():

    serverName = '192.168.29.194'
    serverPort=12000
    
    clientSocket = socket(AF_INET, SOCK_DGRAM)

    while 1:
        message=input()
        clientSocket.sendto(message.encode(), (serverName, serverPort))
    # modifiedMessage, serverAddress =clientSocket.recvfrom(2048)

    # print(modifiedMessage.decode())
    clientSocket.close()

if __name__ == "__main__":
    # creating thread
    t1 = threading.Thread(target=receive)
    t2 = threading.Thread(target=send)
  
    # starting thread 1
    t1.start()
    # starting thread 2
    t2.start()
  
    # wait until thread 1 is completely executed
    t1.join()
    # wait until thread 2 is completely executed
    t2.join()
  
    # both threads completely executed
    print("Done!")    