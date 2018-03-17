from socket import *
import threading


host = "192.168.1.13"
port = 1234
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

packets = []


class network:
    host = "192.168.1.13"
    timeOut = 1
    buffer = 1024

    def __init__(self, host):
        self.host = host

    def Send(self, data):
        print("called send method")
        addr = (host, port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        print("init socket")
        UDPSock.sendto(data.encode("utf8", 'ignore'), addr)
        print("sent data")
        t = threading.Thread(target=self.Listen())
        print("Created listener thread object")
        t.start(self)
        print("started thread; waiting for ACK")
        t.join(self, timeout)
        if ("ACK" == t):
            return "Sent"
        else:
            return "NET FAIL: Send and timout occured"

    def Listen(self):
        print("stated listen method")
        addr = ("", port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        print("bound port; waiting....")
        data = UDPSock.recvfrom(self.buffer)
        data = data.decode("utf-8")
        return data

    def ListenForData(self):
        Data = self.Listen()
        self.Send("ACK")
        return Data


#from CSVHandeling import *


n = network(host)
print(n)
print("sending test with timeout")
n.Send("test")


