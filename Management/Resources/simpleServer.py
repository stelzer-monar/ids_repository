import socket
import logging
import sys
import os

#localIP     = "127.0.0.1"
localIP     = ""
localPort   = 5758
bufferSize  = 1024

msgFromServer       = "Hello UDP Client"
bytesToSend         = str.encode(msgFromServer)

# Create a datagram socket
UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

# Bind to address and ip
UDPServerSocket.bind((localIP, localPort))
logging.basicConfig(format='%(asctime)s.%(msecs)03d %(levelname)-8s %(message)s', level=logging.INFO, datefmt='%Y-%m-%d %H:%M:%S', filename="test.log")
logging.info('UDP server up and listening')
numPackages = 0

# Listen for incoming datagrams
try:
    while(True):
        bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)
        address = bytesAddressPair[1]
        if address[1] == 0:
            address = (address[0],1)
        message = bytesAddressPair[0]
        clientMsg = "Message from Client:{}".format(message)
        clientIP  = "Client IP Address:{}".format(address)
        #logging.info(clientMsg + " " + clientIP)
        # Sending a reply to client
        #UDPServerSocket.sendto(bytesToSend, address)
        numPackages+=1
except KeyboardInterrupt:
    print(numPackages)
    try:
        sys.exit(0)
    except SystemExit:
        os._exit(0)
