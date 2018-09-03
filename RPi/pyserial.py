import serial
import numpy as np
from scipy.fftpack import fft, fftfreq, fftshift
ser = serial.Serial('/dev/ttyUSB1',1152000)
decoded_bytes = None
frequency = -1;
fmedidor = 100000000
ventana_ancho = 3
def detectorflanco(serbytes,index,trigger,automatico):
	initial = -1
	ventana = []
	if(len(serbytes[index:]) > ventana_ancho*2+1 and automatico == 1):
		for x in range(ventana_ancho*2+1):
			ventana.append(float(serbytes[index-ventana_ancho+x])) 
		if((np.amax(ventana[:ventana_ancho]) < trigger) and 
		(np.amin(ventana[ventana_ancho+1:]) > ventana[ventana_ancho]) and 
		(ventana[ventana_ancho]>trigger) ):
			initial =1
	if(automatico == 0):
		if(float(serbytes[index]) > trigger):
			initial = 1
	return initial
			
		
def serialanddecode(trigger,muestras,modo):
	global frequency
	global fmedidor
	decoded_bytes = np.array(np.zeros([muestras]))
	ser.reset_input_buffer()
	ser_bytes = ser.read(muestras*2)
	index = ser_bytes.find(b'\xff\x7f')
	if(index != -1 ):
		frequency = int.from_bytes(ser_bytes[index+2:index+5],byteorder='big')
		ser_bytes= ser_bytes[index+6:]
		if (frequency > 0):
			frequency = fmedidor/frequency
	else:
		count = 0
		for x in range(len(ser_bytes)):
			#decoded_bytes[x] = float(ser_bytes[x])
			if(count == 0 and detectorflanco (ser_bytes,x,trigger,modo) != -1):
				decoded_bytes[count] = float(ser_bytes[x])
				count=count+1
				continue
			if (count>=muestras):
				break
			if (count>0):
				decoded_bytes[count] = float(ser_bytes[x])
				count = count + 1
		if(count >= muestras):
			ser.flushInput()
			return decoded_bytes,1,frequency
		else:
			ser.flushInput()
	return decoded_bytes,-1,0


