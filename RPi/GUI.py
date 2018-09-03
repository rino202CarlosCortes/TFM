import sys
import PyQt5
import numpy as np
from PyQt5.QtWidgets import QApplication, QMainWindow, QMenu, QVBoxLayout, QSizePolicy, QMessageBox, QWidget, QPushButton,QCheckBox,QLabel
from PyQt5.QtGui import QIcon, QKeyEvent,QPixmap
from PyQt5.QtCore import QEvent, Qt,QThread
from scipy.fftpack import fft, fftfreq, fftshift
from scipy.signal import resample,convolve,welch,periodogram
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
from matplotlib.widgets import Cursor
import sys
import matplotlib.pyplot as plt
import pyserial
import random
fft_on=0
res = 0
frecuencia = 1
frecuencia2 = 1
triggermax =250
triggermin = 10
trigger = 50
cursorx=50
cursory=0.5

ok = 0
databuf = []
frecuenciabbuf = 0


escala = 2

voltajemax =4
voltajemin = 0.5
voltaje = 4

muestrasmax =10000
muestrasmin = 10
muestras = 400

timeinterval = 10
timescale = "us"
measure = "V"
cursorcheck = None
button3 = None
button4 = None
button8 = None
modocursor = 0
button12=None
modotr = None
textofrecuencia = None
textofrecuencia2 = None
textocursorx = None
textocursory = None
timer2 = PyQt5.QtCore.QTimer()
timer = PyQt5.QtCore.QTimer()
modotriagact = 0
class threadserial(QThread):
    def __init__(self):
        QThread.__init__(self)
        timer2.timeout.connect(self.pintar)
        timer2.setSingleShot(False)
        timer2.start(1)
    def pintar(self):
        global databuf
        global frecuenciabbuf
        global ok
        timer2.stop()
        if(res == 1 or fft_on == 1):
                databuf,ok,frecuenciabbuf = pyserial.serialanddecode(trigger,int(muestrasmax/2),modotriagact)
        else:
                databuf,ok,frecuenciabbuf = pyserial.serialanddecode(trigger,muestras,modotriagact)
        timer2.start(1)

class App(QMainWindow):
    def __init__(self):
        super().__init__()
        self.left = 10
        self.top = 10
        self.title = 'Sistema de adquisición de datos'
        self.width = 640*escala
        self.height = 400*escala
        self.initUI()
    def initUI(self):
        global modotr
        global cursorcheck
        global textofrecuencia
        global textofrecuencia2
        global textocursorx
        global textocursory
        global button3
        global button4
        global button8
        global button12
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)
 
        m = PlotCanvas(self, width=5*escala, height=4*escala)
        m.move(0,0)
        label = QLabel(self)
        pixmap = QPixmap('laDefense.png')
        label.setPixmap(pixmap)
        label.move(0,0)
        label.resize(150,100)
        label.show()
        button = QPushButton('Trigger +', self)
        button.setToolTip('Aumenta el nivel de disparo')
        button.clicked.connect(self.triggerup)
        button.move(500*escala,0)
        button.resize(140*escala,44*escala)
        
        button.setStyleSheet("background-color:#D4E489;");
        
        button2 = QPushButton('Trigger -', self)
        button2.setToolTip('Disminuye el nivel de disparo')
        button2.clicked.connect(self.triggerdown)
        button2.move(500*escala,44*escala)
        button2.resize(140*escala,44*escala)
        
        button2.setStyleSheet("background-color:#D4E489;");

        button3 = QPushButton('Para', self)
        button3.setToolTip('Detiene la recepción de datos')
        button3.clicked.connect(self.startstop)
        button3.move(500*escala,88*escala)
        button3.resize(140*escala,44*escala)
        button3.setStyleSheet("background-color:#D4E489;");

        button4 = QPushButton('Comienza', self)
        button4.setToolTip('Detiene la recepción de datos')
        button4.clicked.connect(self.startstop)
        button4.move(500*escala,88*escala)
        button4.resize(140*escala,44*escala)
        button4.setVisible(False)
        button4.setStyleSheet("background-color:#D4E489;");

        button5 = QPushButton('Tiempo +', self)
        button5.setToolTip('This s an example button')
        button5.clicked.connect(self.masmuestras)
        button5.move(500*escala,132*escala)
        button5.resize(140*escala,44*escala)
        button5.setStyleSheet("background-color:#D4E489;");

        button6 = QPushButton('Tiempo -', self)
        button6.setToolTip('This s an example button')
        button6.clicked.connect(self.menosmuestras)
        button6.move(500*escala,176*escala)
        button6.resize(140*escala,44*escala)
        button6.setStyleSheet("background-color:#D4E489;");

        button7 = QPushButton('Modo Continuo', self)
        button7.setToolTip('This s an example button')
        button7.clicked.connect(self.FFT)
        button7.move(500*escala,220*escala)
        button7.resize(140*escala,44*escala)
        button7.setStyleSheet("background-color:#D4E489;");
	
        textofrecuencia = QLabel(self)
        textofrecuencia.setToolTip('Frecuencia FPGA')
        textofrecuencia.setText('Frecuencia:' + str(frecuencia) + 'Hz')
        textofrecuencia.move(80*escala,0)
        textofrecuencia.resize(200*escala,10*escala)

        textofrecuencia2 = QLabel(self)
        textofrecuencia2.setToolTip('Frecuencia Señal medida')
        textofrecuencia2.setText('Frecuencia:' + str(frecuencia2) + 'Hz')
        textofrecuencia2.move(80*escala,12*escala)
        textofrecuencia2.resize(200*escala,10*escala)
        
        textocursorx = QLabel(self)
        textocursorx.setToolTip('Frecuencia Señal medida')
        textocursorx.setText('Cursor tiempo:' + str(cursorx) + 'us')
        textocursorx.move(80*escala,12*2*escala)
        textocursorx.resize(200*escala,10*escala)
        
        textocursory = QLabel(self)
        textocursory.setToolTip('Frecuencia Señal medida')
        textocursory.setText('Cursor Voltaje:' + str(cursory) + 'V')
        textocursory.move(80*escala,12*3*escala)
        textocursory.resize(200*escala,10*escala)
        
        button8 = QPushButton('Modo FFT', self)
        button8.setToolTip('This s an example button')
        button8.clicked.connect(self.FFT)
        button8.move(500*escala,220*escala)
        button8.resize(140*escala,44*escala)
        button8.setStyleSheet("background-color:#D4E489;");

        button9 = QPushButton('Voltaje +', self)
        button9.setToolTip('This s an example button')
        button9.clicked.connect(self.voltajeup)
        button9.move(500*escala,264*escala)
        button9.resize(140*escala,44*escala)
        button9.setStyleSheet("background-color:#D4E489;");

        button10 = QPushButton('Voltaje -', self)
        button10.setToolTip('This s an example button')
        button10.clicked.connect(self.voltajedown)
        button10.move(500*escala,308*escala)
        button10.resize(140*escala,44*escala)
        button10.setStyleSheet("background-color:#D4E489;");

        button11 = QPushButton('Modo baja frecuencia', self)
        button11.setToolTip('This s an example button')
        button11.clicked.connect(self.resamplemode)
        button11.move(500*escala,352*escala)
        button11.resize(140*escala,44*escala)
        button11.setStyleSheet("background-color:#D4E489;");

        button12 = QPushButton('Modo alta frecuencia -', self)
        button12.setToolTip('This s an example button')
        button12.clicked.connect(self.resamplemode)
        button12.move(500*escala,352*escala)
        button12.resize(140*escala,44*escala)
        button12.setStyleSheet("background-color:#D4E489;");

        modotr = QCheckBox('Modo Normal / Automatico',self)
        modotr.stateChanged.connect(self.mododisparo)
        modotr.move(50,750)
        modotr.resize(300,25)

        cursorcheck = QCheckBox('Cursor',self)
        cursorcheck.stateChanged.connect(self.cursor)
        cursorcheck.move(320,750)
        cursorcheck.resize(300,25)
        self.show()
    def keyPressEvent(self, e):
        global cursorx
        global cursory
        if e.key() == Qt.Key_A:
           cursorx = (cursorx - muestras*0.01)%muestras
        if e.key() == Qt.Key_D:
           cursorx = (cursorx + muestras*0.01)%muestras
        if e.key() == Qt.Key_W:
           cursory = (cursory + voltaje*0.01)%voltaje
        if e.key() == Qt.Key_S:
           cursory = (cursory - voltaje*0.01)%voltaje
    def cursor(self):
        global modocursor
        if(cursorcheck.isChecked()):
                modocursor = 1
        else:
                modocursor = 0
    def mododisparo(self):
        global modotriagact
        if(modotr.isChecked()):
                modotriagact = 1
        else:
                modotriagact = 0
    def masmuestras(self):
        global muestras
        if (muestras < muestrasmax):
                muestras = int(muestras*1.2)
                
    def menosmuestras(self):
        global muestras
        if (muestras > muestrasmin):
                muestras = int(muestras*0.8)

    def voltajeup(self):
        global voltaje
        if (voltaje < voltajemax):
                voltaje = voltaje +0.25
                
    def voltajedown(self):
        global voltaje
        if (voltaje > voltajemin):
                voltaje = voltaje -0.25

    def triggerup(self):
        global trigger
        if (trigger < triggermax):
                trigger = trigger +5
                
    def triggerdown(self):
        global trigger
        if (trigger > triggermin):
                trigger = trigger -5
    def startstop(self,m):
        global ok
        if(timer2.isActive()):
                timer2.stop()
                button4.setVisible(True)
                ok = 1
        else:
                timer2.start(100)
                button4.setVisible(False)
    def FFT(self):
                global fft_on
                if(fft_on == 0):
                        fft_on =1
                        button8.setVisible(True)
                else:
                        button8.setVisible(False)
                        fft_on = 0
    def resamplemode(self):
                global res
                global muestras
                global button12
                if(res == 0):
                        res =1
                        button12.setVisible(True)
                else:
                        button12.setVisible(False)
                        res = 0
                        #muestras = 1024
def shift(xs, n):
    if n >= 0:
        return np.concatenate((np.full(n, np.nan), xs[:-n]))
    else:
        return np.concatenate((xs[-n:], np.full(-n, np.nan)))
class PlotCanvas(FigureCanvas):
    def __init__(self, parent=None, width=5, height=4, dpi=100):
        
        fig = Figure(figsize=(width, height), dpi=dpi)
       	self.axes = fig.add_subplot(111)
        timer.timeout.connect(self.plot)
        timer.setSingleShot(False)
        timer.start(timeinterval)
        FigureCanvas.__init__(self, fig)
        self.setParent(parent)
 
        FigureCanvas.setSizePolicy(self,
                QSizePolicy.Expanding,
                QSizePolicy.Expanding)
        FigureCanvas.updateGeometry(self)
        #self.plot()
    def left(s, amount):
        return s[:amount]
    def plot(self):
        global timescale
        global textofrecuencia
        global textofrecuencia2
        global measure
        global cursorx
        global databuf
        global cursory
        global muestras
        """
        if(res == 1 or fft_on == 1):
                data,ok,frecuenciab = pyserial.serialanddecode(trigger,int(muestrasmax/2),modotriagact)
        else: 
                data,ok,frecuenciab = pyserial.serialanddecode(trigger,muestras,modotriagact)
        """
        data = databuf
        frecuenciab = frecuenciabbuf
        
        if (len(data)>512):
                if(data[511] == 0):
                        data[511] = data[512]#se incluye porque debido al bufer de la uart a veces se pone este valor a 0 (solucion provisional)
        #data = [random.random() for i in range(25)]
        if (len(data)>510):
                if(data[510] == 0):
                        data[510] = data[509] #se incluye porque debido al bufer de la uart a veces se pone este valor a 0 (solucion provisional)
        #data = [random.random() for i in range(25)]
        if(ok == 1):
                muestraspintar = muestras 
                self.figure.clf()   
                data = data*0.015
                ax = self.figure.add_subplot(111)
                T = 1.0 / 961000.0
                valorresample = muestrasmax
                relacionfrecuencia = 1.0
                desplazamiento = 0
                muestrasresample = 1.0
                if(frecuenciab != -1):
                        textofrecuencia.setText('Frecuencia FPGA:' + (str(frecuenciab).split('.'))[0]+ 'Hz')
                if(res == 1 and int(frecuenciab) >500000): #hay que tener una version actualizada de la frecuencia enviada por la fpga
                        muestrasresample = 3
                        y = data
                        yf = fft(y)
                        yf = np.abs(yf)
                        yf2 = yf[1:]
                        xf = fftfreq(muestrasmax, T) 
                        frecuenciafft = np.abs(xf[np.argmax(yf2)]) # se obtiene una version actualizada de la frecuencia de la señal submuestreada
                        textofrecuencia2.setText('Frecuencia medida:' + (str(frecuenciafft).split('.')[0] + 'Hz'))
                        relacionfrecuencia = frecuenciab/frecuenciafft
                        print(relacionfrecuencia)
                        valorresample = muestrasmax*muestrasresample #int(muestrasmax*(frecuenciab/frecuenciafft))
                        data = resample(data, valorresample)
                        T = T/relacionfrecuencia
                        
                
                                   
                if (fft_on ==1):
                        timescale = "Hz"
                        measure = "Espectro de frecuencias normalizado"
                        x = np.linspace(0.0, muestras*T, muestras)
                        y = data
                        yf = fft(y)
                        yf = np.abs(yf)
                        yf2 = yf[1:]
                        #yf2 = resample(yf2,muestrasmax-1)
                        xf = fftfreq(len(yf), T)
                        xf = xf*muestrasresample
                        frecuenciafft = np.abs(xf[np.argmax(yf2)])
                        yf = np.append(yf[0],yf2)
                        frecuenciafft = xf[np.argmax(yf[1:])]
                        if(frecuenciafft == valorresample-1):
                                frecuenciafft = 1;
                        textofrecuencia2.setText('Frecuencia medida:' + (str(frecuenciafft).split('.')[0] + 'Hz'))
                        xf = fftshift(xf)
                        yplot = fftshift(yf)
                        #yplot= np.abs(np.power(yplot,2))*T/muestrasmax
                        xf,yplot= periodogram(data,muestrasresample/T)
                        xf = xf[:int(len(xf)*(muestras/muestrasmax))]
                        #ax.plot(xf[int(len(xf)/2) +1 : int((muestraspintar/muestrasmax)*len(xf))], yplot[int(len(yplot)/2) +1 : int((muestraspintar/muestrasmax)*len(xf))])
                        ax.plot(xf,yplot[:len(xf)])
                        #if(modocursor):
                            #ax.axhline(y = cursory,linestyle = 'dashed', color = 'g')
                            #ax.axvline(x = cursorx,linestyle = 'dashed', color = 'g')
                            #textocursorx.setText('Cursor Hz:' + "{0:.2f}".format(xf[])+ 'Hz')
                            #textocursory.setText('Cursor Voltaje:' + "{0:.2f}".format(cursory)  + 'V')
                        
                        #self.draw()

                else:
                        if (len(data) != muestras and res != 1):
                            muestraspintar = len(data)
                        timescale = "us"
                        measure = "V"
                        x = np.linspace(0,muestraspintar/(relacionfrecuencia*muestrasresample),muestraspintar) #/np.power(relacionfrecuencia,2)

                        if(modotriagact == 1):
                                ax.axis((-1,muestraspintar/(relacionfrecuencia*muestrasresample),0,voltaje)) #/np.power(relacionfrecuencia,2)
                                desplazamiento = (data[0]-float(trigger*0.0130))/(data[0]-data[1])
                                print(desplazamiento)
                                x = np.insert(x,0,desplazamiento)

                                x = x+np.abs(desplazamiento)
                                data = np.insert(data,0,trigger*0.0125)
                                ax.plot(x,data[:muestraspintar+1], 'r-')
                        else:
                                ax.axis((0,muestraspintar/(relacionfrecuencia*muestrasresample),0,voltaje)) #/np.power(relacionfrecuencia,2)
                                if (res == 1):
                                        ax.plot(x[:muestraspintar],data[:muestraspintar], 'ro-')
                                else:
                                        ax.plot(x[:muestraspintar],data[:muestraspintar], 'r-')
                        ax.axhline(y=trigger*0.0125)
                        if(modocursor):
                            ax.axhline(y = cursory,linestyle = 'dashed', color = 'g')
                            ax.axvline(x = cursorx/(relacionfrecuencia*muestrasresample),linestyle = 'dashed', color = 'g')
                            textocursorx.setText('Cursor tiempo:' + "{0:.2f}".format(cursorx/(relacionfrecuencia*muestrasresample))+ 'us')
                            textocursory.setText('Cursor Voltaje:' + "{0:.2f}".format(cursory)  + 'V')
                        
                        
                        

                ax.set_facecolor('#8AAEC0')
                             
                ax.set_xlabel(timescale)
                ax.set_ylabel(measure)
                ax.set_title(' ')
        self.draw()

       
if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    ser = threadserial()
    sys.exit(app.exec_())
