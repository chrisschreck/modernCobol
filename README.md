# Modern Cobol: Docker-Container 

Originally, the prototype was to include a container with an existing program, which would then run on the mainframe at the end. However, the z/os extension z/cx is missing for this project in order to be able to run containers on the mainframe. For this reason, the prototype will include a kind of "proof-of-concept", in which a new Cobol program is created that contains standard components. These are essential for the transformation. The aim is therefore to show that these components already work in a container and that further steps can now be taken to drive the implementation forward.

## Getting started
## Installation

On Mac: Install gnu-cobol with npm

```bash
  brew install gnu-cobol
```

To compile the Cobol-Code execute die following line:

```bash
  cobc -x -free file.cob
```
## Procedure

### First Step: Simple Cobol-Code ###

```cobol
  IDENTIFICATION DIVISION.
  PROGRAM-ID. HelloWorld.
  PROCEDURE DIVISION.
  DISPLAY "Hello World!!!".
  STOP RUN.
```

### Second Step: Dockerfile ###

This is a sample Dockerfile, please make sure that it is suitable in your environment.

```docker
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
```

### Third Step: Dockerfile ###

Attention! Please ensure that you execute this command outside the project folder!

```bash
  docker build -f cobol/Dockerfile --force-rm -t coboltest .
```
```bash
  docker run coboltest
```

### Fourth Step: The output ###

The output is:

```bash
  Hello World!!!
```

### Fifth Step: Cobol in web via HTTP ###

The application will be available via the browser. Still in progress, will be updated soon.

## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)

