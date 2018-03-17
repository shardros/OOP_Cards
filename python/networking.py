from socket import *
import threading

host = "192.168.1.1"
port = 13000
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

packets = []


class network:
    host = ""
    timeOut = 1

    def __init__(self, host):
        self.host = host

    def Send(self, data):
        addr = (host, port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.sendto(data.encode("utf8", 'ignore'), addr)
        t = threading.Thread(target=self.Listen())
        t.start(self)
        t.join(self, timeout)
        if ("ACK" == t):
            return "Sent"
        else:
            return "Network failure"

    def Listen(self):
        addr = ("", port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        data = UDPSock.recvfrom(self.buffer)
        data = data.decode("utf-8")
        return data

    def ListenForData(self):
        Data = self.Listen()
        self.Send("ACK")
        return Data



