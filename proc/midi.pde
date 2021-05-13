// Haptic to Audio

import themidibus.MidiBus;

MidiOut midiOut = new MidiOut();

class MidiOut {
  MidiBus myBus;
  int last_pitch = -1;
  boolean ignore = false;
  int pitch_from_network = -1;

  MidiOut() {
    MidiBus.list();

    myBus = new MidiBus(this, -1, "Microsoft GS Wavetable Synth");
    myBus.sendMessage("\u00c0\u0049".getBytes());

    // myBus = new MidiBus(this, -1, "SimpleSynth virtual input");

    // myBus = new MidiBus(this, -1, "VirtualMIDISynth #1");

    // Android
    // myBus = new MidiBus(this, -1, "MIDI function");

    // myBus = new MidiBus(this, -1, "Gervill");
  }

  void play(int pitch) {
    clear();
    myBus.sendNoteOn(0, pitch, 127);
    last_pitch = pitch;
  }

  void clear() {
    if (last_pitch != -1) {
      myBus.sendNoteOff(0, last_pitch, 127);
      last_pitch = -1;
    }
  }

  void onNoteControlChange() {
    if (ignore) {
      return;
    }
    if (pitch_from_network == -1) {
      clear();
    } else {
      play(pitch_from_network);
    }
  }

  void pulse() {
    int pitch = last_pitch;
    clear();
    play(pitch);
  }

  void setExpression(int value) {
    int number;
    if (MIDI_advanced_expression) {
      number = 11;
    } else {
      number = 7;
    }
    myBus.sendControllerChange(0, number, value);
  }

  void setPitchBend(int value) {
    myBus.sendMessage(224, value % 128, value / 128);
  }
}
