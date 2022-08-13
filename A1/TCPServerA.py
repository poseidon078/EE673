from socket import *
serverSocket =socket(AF_INET, SOCK_STREAM)
serverPort=12000
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
print('The server is ready to receive at port: ', serverSocket.getsockname())

while 1:
    connectionSocket, addr=serverSocket.accept()
    
    print('Recieved request from', connectionSocket.getpeername())
    print('Started connection over new local socket:', connectionSocket.getpeername())
    print('Waiting for user input')
    
    message=connectionSocket.recv(1024)
    modifiedMessage=message.upper()
    connectionSocket.send(modifiedMessage)
    connectionSocket.close()
    print('Request Complete, connection terminated')