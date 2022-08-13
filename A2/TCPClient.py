
from socket import *
import time
serverName = 'localhost'
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.bind(('',12001))
clientSocket.connect((serverName,serverPort))

num=0
num_max = 10000; # modify for varying the numbers to be sent
maxl=len(str(num_max))
send_delay = 0.01;
clientSocket.send((str(maxl)).encode())
time.sleep(send_delay)
while num < num_max:
	num=num+1
	k=maxl-len(str(num))
	print(num)
	clientSocket.send(('0'*k+str(num)).encode())
	time.sleep(send_delay) # vary delay here

clientSocket.close()
print('Connection Closed')