from socket import *
import time

port = 1234

class network:
    host = ""
    timeOut = 1
    buffer = 1024

    def __init__(self, host):
        self.host = host

    def Send(self, data):
        addr = (self.host, port)
        Sock = socket(AF_INET, SOCK_DGRAM)
        Sock.sendto(data.encode("utf8", 'ignore'), addr)
        Sock.close()

    def SendData(self, data):
        self.Send(data)
        response = self.Listen()
        print("Got response ", response)
        if (response == "ACK"):
            return "RECIVED ACK"
        else:
            return "NET FAIL"

    def Listen(self):
        addr = ("", port)
        Sock = socket(AF_INET, SOCK_DGRAM)
        Sock.bind(addr)
        (data, hostAddr) = Sock.recvfrom(self.buffer)
        data = data.decode("utf-8")
        Sock.close()
        return data

    def ListenForData(self):
        Data = self.Listen()
        time.sleep(0.5)
        self.Send("ACK")
        return Data

    def __exit__(self, exc_type, exc_val, exc_tb):
        """some clean up code probably should exist"""




