FROM htfy96/lug:latest

RUN apt-get update && apt-get install rsync awscli python3-pip rsync python wget -y
RUN pip3 install bandersnatch
RUN wget -O gcloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-183.0.0-linux-x86_64.tar.gz?hl=zh-cn && tar xavf gcloud.tar.gz && rm -rf gcloud.tar.gz && ./google-cloud-sdk/install.sh
