from networking import *
from CSVHandeling import *

def SendAndVerify(data, network):
    if __name__ == '__main__':
        network.send(data)
        p = multiprocessing.Process(target=network.Listen)
        p.start()

host = "192.168.1.1"

n = network(host)


