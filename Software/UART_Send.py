import serial
import time

# Configure the serial port
ser = serial.Serial("COM3", 9600) #open serial port

print(ser.name)



#ser.write(b'm')

library = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r'}

for i in library:
    print(f"Printing: '{i}'")
    ser.write(i.encode('utf-8'))
    time.sleep(1)






