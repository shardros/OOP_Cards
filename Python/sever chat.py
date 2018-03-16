import os
from socket import *
import csv
import time

host = ""
port = 13000
buffer = 1024
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

def listen(host, port):
     addr = (host, port)
     UDPSock = socket(AF_INET, SOCK_DGRAM)
     UDPSock.bind(addr)
     rawData = UDPSock.recvfrom(buffer)
     RawData = rawData.decode("utf-8")
     UDPSock.close()
     return rawData


print("Students must enter the following as the IP: " +
socket.gethostbyname(socket.gethostname()))


