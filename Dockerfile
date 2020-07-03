FROM ubuntu:20.10

WORKDIR /app

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade 
RUN apt-get install -y python3-pip python3-tk wget tzdata libasound-dev

RUN wget http://portaudio.com/archives/pa_stable_v190600_20161030.tgz && tar -zxvf *.tgz

RUN cd portaudio && ./configure && make && make install && cd ..

RUN apt-get install -y portaudio19-dev python3-all-dev

RUN pip install pyaudio numpy matplotlib pyqt5 pyqtgraph

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "./visualizer.py" ]