import multiprocessing
from socket import *
import time

data = ""

class Networking():
    port = 1234
    buffer = 1024
    
    def Listen(self, data):
        print("stated listen method")
        addr = ("", self.port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        print("bound port; waiting....")
        (data, hostAddr) = UDPSock.recvfrom(self.buffer)
        data = data.decode("utf-8")




if __name__ == '__main__':
    # Start bar as a process
    n = Networking()
    p = multiprocessing.Process(target=n.Listen(data))
    p.start()

    # Wait for 10 seconds or until process finishes
    p.join(10)

    print(data)

    # If thread is still active
    if p.is_alive():
        print("running... let's kill it...")

        # Terminate
        p.terminate()
        p.join()

"""import multiprocessing
from socket import *
import time


class Networking():
    port = 1300
    buffer = 1024
    
    def Listen(self):
        print("stated listen method")
        addr = ("", self.port)
        UDPSock = socket(AF_INET, SOCK_DGRAM)
        UDPSock.bind(addr)
        print("bound port; waiting....")
        (data, hostAddr) = UDPSock.recvfrom(self.buffer)
        data = data.decode("utf-8")
        return data


n = Networking()
t = multiprocessing.Process(target=n.Listen)
t.start()                                 
t.join(10)
print("JOINED")

if t.is_alive():
    t.terminate()
    print("killed")
"""
