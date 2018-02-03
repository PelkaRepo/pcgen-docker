# pcgen-docker
Docker image detail for PCGen

# Build

To build image locally:

```bash
#!/bin/bash -e

sudo docker build --no-cache --rm --tag pcgen:latest .
```

# Run

Running the Docker image with X11 display driver mapping:

```bash
#!/bin/bash -e

sudo docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/pcgen/pcgen --name pcgen pcgen:latest
```

# Docker Display Mapping Issue Resolution

There are commonly known issues when mapping X11 display servers to Docker containers.  The following
error is usually symptomatic of this:  ``

To resolve, enter the following on the Docker host and then re-run the Docker container:

```
#!/bin/bash -e

sudo apt-get -y -q install xorg openbox
sudo xhost +
```
