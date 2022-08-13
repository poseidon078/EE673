from socket import *
serverPort=12000
serverSocket=socket(AF_INET, SOCK_STREAM)
serverSocket.bind(('', serverPort))
serverSocket.listen(1)
print("Server ready to receive")


import socket
while 1:
    connectionSocket, addr=serverSocket.accept()
    print(addr)
    sentence=connectionSocket.recv(1024) #receive the request
    if sentence:
        print(str(sentence))
        data=None
        if sentence.find(b'iitk.ac.in')!=-1: #if the request has 'iitk.ac.in'
            with socket.socket(AF_INET, SOCK_STREAM) as s:
                s.connect(('home.iitk.ac.in', 80)) #connect to home.iitk.ac.in
                http_req=sentence.decode('ascii')
                s.sendall(http_req.encode())
                data=s.recv(4096)
            connectionSocket.send(data)
            connectionSocket.close()
        else:
            connectionSocket.send(b'This site is not allowed for browsing')
            connectionSocket.close()
    
