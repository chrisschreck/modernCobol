FROM ubuntu
RUN apt-get update
RUN apt-get install -y gnucobol gcc
RUN mkdir /app

# copy all the files to the container
COPY ./cobol /app

# set workdir
WORKDIR /app

# exec cobol
RUN cobc -x -free *.cob