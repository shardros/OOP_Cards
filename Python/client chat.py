#Import items, define the totalscore
import random
Totalscore = 0
#Client setup
import os
from socket import *
#Get IP adress of target computer
host = input("Enter sever computers IP addr:")
port = 13000
addr = (host, port)
UDPSock = socket(AF_INET, SOCK_DGRAM)


#Ask for name, test that it contains at least one character.
Name = input("What is your name? YOU MAY NOT HAVE SPACES IN YOUR NAME")
while len(Name)<1:
    print("Please enter a name.")
    Name = input("What is your name? ")
print("Hello, " + Name + ".")
#Loop 15 times
for x in range(0,15):
    #Generate random numbers and the symbol
    Symbol = random.randrange(1,3)
    Number1 = random.randrange(1,99)
    Number2 = random.randrange(1,99)
    if Symbol == 1:
        #If the symbol number is 1, use a +
        Answer = Number1 + Number2
        print(str(Number1) + " + " + str(Number2) + " = ")
    elif Symbol == 2:
        #If the symbol number is 2, use a -
        Answer = Number1 - Number2
        print(str(Number1) + " - " + str(Number2) + " = ")
    elif Symbol == 3:
        #If the symbol number is 3, use a *
        Answer = Number1 * Number2
        print(str(Number1) + " x " + str(Number2) + " = ")
    #Ask for answers until an integer is given
    while True:
        try:
            UserAnswer = int(input())
            break
        except ValueError:
            print("That's not a valid answer. Answers should be integers and contain no text.")
    if Answer == UserAnswer:
        #If the user answer is the same as the actual answer, award a point and congratulate
        Totalscore = Totalscore + 1
        print("You got it right! You have got " + str(Totalscore) + " points so far!")
    else:
        #Otherwise, show the correct answer
        print("You got it wrong, the answer was " + str(Answer) + ", you have " + str(Totalscore) + " points so far")
#After the test, show their score
print("The test is over, you got " + str(Totalscore) + " out of 15!")
#Ask for valid class number and append data together
while True:
        try:
            Class = int(input("What is your class number? "))
            if Class>0 and Class<5:
                break
        except ValueError:
            print("Please enter a valid number.")
Data = Name + " " + str(Totalscore) + " " + str(Class)
print(Data)
print("Uploading score...")


#--------------------------UPLOAD CODE-----------------------------

try:
    while True:
        UDPSock.sendto(Data.encode("ASCII", 'ignore'), addr) #Encode and upload data
        print("Data uploaded")
        break
except KeyboardInterrupt:
    UDPSock.close()
    os._exit(0)




