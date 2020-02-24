#Download LTS ubuntu
FROM ubuntu:18.04
MAINTAINER k.jurkiewicz

#setup locale
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#install necessary tools
RUN apt-get update && apt-get install -y python python-dev python3.7 python3.7-dev python-pip virtualenv libssl-dev libpq-dev git build-essential libfontconfig1 libfontconfig1-dev
RUN pip install setuptools pip --upgrade --force-reinstall
#RUN apt-get install -y python3 python3-pip python3-ipdb
RUN apt-get install -y git vim
RUN which python3

RUN mkdir -p /root/workspace && cd /root/workspace && git clone -b fine_tuning_for_gonito --single-branch https://github.com/huntekah/MastersThesis
RUN cd /root/workspace/MastersThesis && virtualenv --python=/usr/bin/python3.7 venv
COPY "./requirements.txt" "/root/workspace/MastersThesis/requirements.txt"
RUN cd /root/workspace/MastersThesis && . venv/bin/activate && pip install -r requirements.txt
RUN cd /root/workspace/MastersThesis && pip install spacy

RUN cd /root/workspace/MastersThesis/scripts && . /root/workspace/MastersThesis/venv/bin/activate && python -m spacy download en_core_web_sm

