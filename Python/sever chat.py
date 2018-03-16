import socket
print("Students must enter the following as the IP: " +
socket.gethostbyname(socket.gethostname()))
import os
from socket import *
host = ""
port = 13000
buf = 1024
addr = (host, port)
while True:
     UDPSock = socket(AF_INET, SOCK_DGRAM)
     UDPSock.bind(addr)
     print("Waiting to receive messages...")
     (data, addr) = UDPSock.recvfrom(buf)
     data = data.decode("ascii")
     UDPSock.close()

     x=0
     while x != len(data):
          if data[x] == " ":
              Name = data[0:x]
              print(Name)
              break
          x = x+1
     data = data[x+1:len(data)]
     x=0
     while x != len(data):
          if data[x] == " ":
              Score = data[0:x]
              print(Score)
              break
          x = x+1
     Class = data[x+1:len(data)]
     print(Class)
