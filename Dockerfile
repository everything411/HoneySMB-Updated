FROM ubuntu
MAINTAINER Sehrish Shafeeq

RUN apt-get update -y && apt-get install python2.7 -y
RUN apt-get update
RUN apt-get install tcpdump -y
RUN apt-get install aptitude -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common -y
RUN apt-add-repository universe -y
RUN apt-get update
RUN apt-get install python3-pip -y
RUN apt-get install aptitude -y
RUN apt-get install curl -y
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python2.7 get-pip.py
RUN apt-get install python-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev -y
RUN apt-get install libblas-dev libatlas-base-dev -y

RUN mkdir -p /home/smb

COPY libs /home/smb/libs
COPY credentials_file /home/smb/credentials_file
COPY __init__.py /home/smb/__init__.py
COPY shares.conf /home/smb/shares.conf
COPY smbserver.py /home/smb/smbserver.py
COPY smb.conf /home/smb/smb.conf

COPY startup_scripts.sh /home/smb/startup_scripts.sh
RUN chmod 754 /home/smb/startup_scripts.sh

COPY requirements.txt /home/smb/requirements.txt
RUN pip install -r /home/smb/requirements.txt

EXPOSE 445 139

ENTRYPOINT ["bash"]
CMD ["-c","/home/smb/startup_scripts.sh"]
