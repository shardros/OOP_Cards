from socket import *
import time


host = "192.168.1.6"
port = 1234
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

packets = []


class network:
    host = ""
    timeOut = 1
    buffer = 1024

    def __init__(self, host):
        self.host = host

    def Send(self, data):
        addr = (host, port)
        print("atempting conection to ", addr)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.sendto(data.encode("utf8", 'ignore'), addr)
        print("sent")

    def SendData(self,data):
        self.Send(data)
        response = self.Listen()
        print("Got response ", response)
        if (response == "ACK"):
            return "RECIVED ACK"
        else:
            return "NET FAIL"

    def Listen(self):
        print("stated listen method")
        addr = ("", port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        print("bound port; waiting....")
        (data, hostAddr) = UDPSock.recvfrom(self.buffer)
        data = data.decode("utf-8")
        print("Got data: ", data)
        return data

    def ListenForData(self):
        Data = self.Listen()
        time.sleep(0.5)
        self.Send("ACK")
        return Data


#from CSVHandeling import *


n = network(host)
print(n)
print("sending test")
print(n.SendData("I CAN USE NETWORKS!!!!!(*&F*()SA ¬¬!1`¬`"))


