# docker-julia-arduino

A docker image for Julia 1.8.3 with AVR backend.

## From DockerHub

```sh
docker pull okamumu/julia:1.8.3-arduino
```

This image is the multiple for AMD64 and ARM64.

## Run

An example for running:
```sh
docker run -it --rm --name julia -v $(pwd):/home/work -w /home/work okamumu/julia:1.8.3-arduino
```

## Notes

- The AVR tools are required to make obj and hex for arduino
```sh
docker exec -it julia /bin/bash
apt update
apt install gcc-avr avr-libc avrdude
```
