import 'dart:io';

import 'package:cbj_smart_device/utils.dart';

class RecognitionClass {
  Future listenToLightCommend() async {
    final List<String> pythonCommends = <String>[];
    pythonCommends.add('-c');
    pythonCommends.add('''
#!/usr/bin/env python3

try:
    # NOTE: this example requires PyAudio because it uses the Microphone class
    import wave
    import pyaudio
    import speech_recognition as sr

    form_1 = pyaudio.paInt16  # 16-bit resolution
    chans = 1  # 1 channel
    samp_rate = 44100  # 44.1kHz sampling rate
    chunk = 4096  # 2^12 samples for buffer
    record_secs = 5  # seconds to record
    dev_index = 3  # device index found by p.get_device_info_by_index(ii)
    wav_output_filename = 'speech.wav'  # name of .wav file

    def show_devices():
        p = pyaudio.PyAudio()
        print()
        for ii in range(p.get_device_count()):
            print(p.get_device_info_by_index(ii).get('name'))


    def record():


        wav_output_filename = 'test1.wav'  # name of .wav file

        audio = pyaudio.PyAudio()  # create pyaudio instantiation

        # create pyaudio stream
        stream = audio.open(format=form_1, rate=samp_rate, channels=chans,
                            input_device_index=dev_index, input=True,
                            frames_per_buffer=chunk)
        print("recording")
        frames = []

        # loop through stream and append audio chunks to frame array
        for ii in range(0, int((samp_rate / chunk) * record_secs)):
            data = stream.read(chunk)
            frames.append(data)

        print("finished recording")

        # stop the stream, close it, and terminate the pyaudio instantiation
        stream.stop_stream()
        stream.close()
        audio.terminate()

        # save the audio frames as .wav file
        wavefile = wave.open(wav_output_filename, 'wb')
        wavefile.setnchannels(chans)
        wavefile.setsampwidth(audio.get_sample_size(form_1))
        wavefile.setframerate(samp_rate)
        wavefile.writeframes(b''.join(frames))
        wavefile.close()


    def google_recognition(r, audio):
        try:
            print("google thinks you said: " + r.recognize_google(audio))
        except sr.UnknownValueError:
            print("google could not understand audio")
        except sr.RequestError as e:
            print("google error; {0}".format(e))
        exit()

    def sphinx_recognition(r, audio):
        # recognize speech using Sphinx
        try:
            speech_text = r.recognize_sphinx(audio)
            print("Sphinx thinks you said: " + speech_text)
            exit()
        except sr.UnknownValueError:
            print("Sphinx could not understand audio")
        except sr.RequestError as e:
            print("Sphinx error; {0}".format(e))
        exit()


    def audio_to_text():
        print("The end")
        print()
        # obtain audio from the microphone
        r = sr.Recognizer()

    
        with sr.AudioFile(wav_output_filename) as source:
            print("Say something!")
            audio = r.listen(source)

        # obtain audio from the microphone
        #
        print("Next line")

        print("google recognition")
        google_recognition(r, audio)
        print("sphinx recognition")
        # sphinx_recognition(r, audio)

    def audio_to_text_microphone():
        print("The end")
        print()
        # obtain audio from the microphone
        r = sr.Recognizer()
        with sr.Microphone(dev_index, samp_rate, chunk) as source:
            print("Say something!")
            audio = r.listen(source, record_secs, 5)
            with open('speech.wav', 'wb') as f:
              f.write(audio.get_wav_data())

        # obtain audio from the microphone
        #
        print("Next line")

        print("google recognition")
        google_recognition(r, audio)
        print("sphinx recognition")
        # sphinx_recognition(r, audio)

    show_devices()
    while True:
        print("Now record")
        record()
        audio_to_text_microphone()
        print("Now recogniseing")
        #audio_to_text()

except Exception as e:
    print("This is python exeption: " + str(e))

''');
    while (true) {
      logger.i('Try me');
      await Process.run('python3', pythonCommends)
          .then((ProcessResult results) {
        logger.i(results.stdout);
      });
      logger.i('Done');
    }
  }
}
