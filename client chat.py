import csv
import time
import os
from socket import *

host = input("Enter sever computers IP addr:")
port = 13000
toDelphiFile = "ToDelphi.csv"
fromDelphiFile = "ToPython.csv"

packets = []

def Send(data, host, port):
    addr = (host, port)
    UDPSock = socket(AF_INET, SOCK_DGRAM)
    UDPSock.sendto(Data.encode("utf8", 'ignore'), addr) 

def Listen(host, port):
     addr = (host, port)
     UDPSock = socket(AF_INET, SOCK_DGRAM)
     UDPSock.bind(addr)
     rawData = UDPSock.recvfrom(buffer)
     RawData = rawData.decode("utf-8")
     UDPSock.close()
     return rawData

def CSVRead(filename):
    with open(filename, 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            rows.append(row)

    return rows

def CSVAppend(filename, data):
    with open(filename, 'a') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerows(data)

 
