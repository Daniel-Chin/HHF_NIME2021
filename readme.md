# Hyper-hybrid flute, for NIME 2021
This is a snapshot of the HHF repository taken for NIME 2021. The main repository is at https://github.com/Daniel-Chin/HHF.  

- It does not incorporate the regression results, so everything is still linear;  
- and, there is a live camera capture feature for demo recording.  

This readme presents a short tutorial on how to run the demo on your computer. 

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

## Hardware fabrication
