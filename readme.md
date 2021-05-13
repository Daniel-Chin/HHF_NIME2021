# Hyper-hybrid flute, for NIME 2021
This is a snapshot of the HHF repository taken for NIME 2021. The main repository is at https://github.com/Daniel-Chin/HHF.  

- It does not incorporate the regression results, so everything is still linear;  
- and, there is a live camera capture feature for demo recording.  

This readme presents a short tutorial on how to run the demo on your computer. 

## Contact me
If it is confusing, please send feedback to me or open an issue. If you need further assistance, feel free to contact me via email.  

## How to run
### Download Processing 3
You need Processing 3 to run the software interface.  
Official site: https://processing.org/  
Download page: https://processing.org/download/  

(For those who do not want to install anything: on Windows, Processing 3 is a standalone exe.)  

Then, use Processing 3 to open file `./proc/proc.pde`. Press the play button to run.  

### Connect a MIDI output
The demo outputs MIDI messages. To hear sounds, you need to connect the demo with either a software synthesizer or a physical synthesizer.  

If you do not have any synthesizers available, Windows comes with a "Microsoft GS Wavetable Synth" that also works.  

To configure the MIDI output, edit `./midi.pde`. In that file, search for `myBus = new MidiBus`. Change the device name to your device. To see a list of detected MIDI devices, run the Processing sketch and take a look at the log output. The log output is below the source code editor.  

## Parameters
Program parameters can be found at the top of `proc.pde` and `network.pde`.  

### Keyboard-and-mouse / touchscreen demo
If you want to run the keyboard-and-mouse demo, simply make sure that `DEBUGGING_NO_ARDUINO` is set to `true` on the top of `proc.pde`.  

An arguably better experience is achieved on a touchscreen. To use the touchscreen mode, make sure that `TOUCH_SCREEN` is set to `true` on the top of `proc.pde`.  

### With-hardware demo
If you want to run the demo with our hardware, make sure that `DEBUGGING_NO_ARDUINO` is set to `false` on the top of `proc.pde`.  

Then, refer to the next section, "Hardware fabrication". 

Then, you need to setup the Bluetooth connection as a Serial port on your OS. You may refer to tutorials on "HC05 with Arduino".  

To configure the HC-05 Bluetooth module, use our helper sketch at `./ardu/setupBluetooth/setupBluetooth.ino`. 

Finally, upload `./ardu/ardu.ino` to the Arduino. 

## Hardware fabrication
### You will need
- 3D printing. 
- A six-hole recorder. 
- An Arduino Nano. 
- An HC05/HC06 Bluetooth module. 
- A BMP085 sensor. 
- Some moisture absorbers. (We just took some from packaged food.)
- A 5V battery. 
- Some bronze tape. 
- Jumper cables. 
- Optionally, 3mm-diameter nuts and bolts. 

### General guidelines
- Put bronze tape onto the recorder holes as capacitive sensors. Connect them to Arduino pin 7, 6, 5, 4, 3, 2. 
- Bluetooth Serial pins to Arduino pin 10 for RX, 11 for TX. Notice that you may need to drop the voltage to 3.3V in order to not overload the HC05. However, there is a Chinese HC06 variant that officially supports 5V. 
- Make the sensorBox. 3D models are at `./3d_models/`. I recommend to *only add support that touches buildplate*. A 3mm nut and bolt can be used to secure the sensor in the sensorBox. Add moisture absorbers above the grates. Seal the sensorBox air-tight with tape. `boxRing.stl` and `ringRail.stl` are optional parts that secure the sensorBox in the mouthpiece.  
- Connect the sensorBox sensor data pins to SDA and SCL on your Arduino.  
- Use the battery to power the Arduino.  

Again, if you have questions about any of the above steps, please refer to the "contact me" section above.  
