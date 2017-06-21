FROM corydodt/circus-base:latest

ENV duplyDir=/etc/duply/system
RUN mkdir -p $duplyDir /opt/s3duplyrestore

RUN apk add duply

WORKDIR /opt/s3duplyrestore
COPY requirements.txt  .
RUN pip install -r requirements.txt

COPY exclude conf.in $duplyDir/
COPY 00-jentemplate.ini /etc/circus.d/

