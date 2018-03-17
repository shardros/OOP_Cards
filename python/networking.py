import time
import os
from socket import *
import multiprocessing

host = "192.168.1.1"
port = 13000
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

packets = []

class network:
    host = ""
    timeOut = 10
    
    def __init__(self, host):
        self.host = host

    def Send(self, data):
        addr = (host, port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.sendto(data.encode("utf8", 'ignore'), addr)

    def Listen(self):
        addr = ("", port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        data = UDPSock.recvfrom(buffer)
        data = data.decode("utf-8")
        return data

    def ListenForData(self):
        Data = Listen()        
        Send("ACK", str(time.time()))
        return Data    



