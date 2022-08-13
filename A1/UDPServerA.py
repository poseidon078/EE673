from socket import *
serverSocket =socket(AF_INET, SOCK_DGRAM)
serverPort=12000
serverSocket.bind(('', serverPort))
print('The server is ready to receive at port: ', serverSocket.getsockname())

while 1:
    message, clientAddress =serverSocket.recvfrom(2048)
    print('Recieved request from', clientAddress)
    modifiedMessage=message.upper()
    serverSocket.sendto(modifiedMessage, clientAddress)