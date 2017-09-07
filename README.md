# What is XMR-Stak-Nvidia?

XMR-Stak-Nvidia is a universal Stratum pool miner. This is the Nvidia GPU-mining version running in docker.


## Links

- [XMR-Stak-Nvidia Source Code](https://github.com/fireice-uk/xmr-stak-nvidia)

# How to use this image

You MUST install first [Nvidia-docker]()https://github.com/NVIDIA/nvidia-docker)

## Configuration file

Create `config.txt` configuration file and adapt to your need before running.
You can copy file from a container:

```console
$ docker run -d --name some-xmr-stak-nvidia cedricwalter/docker-xmr-stak-nvidia
$ docker cp some-xmr-stak-nvidia:/usr/local/etc/config.txt .
$ docker stop some-xmr-stak-nvidia
$ docker rm some-xmr-stak-nvidia
```

or copy example from [GitHub](https://github.com/fireice-uk/xmr-stak-nvidia/blob/master/config.txt).

## Running

Run in background:

```console
$ nvidia-docker run --rm -itd --name some-xmr-stak-nvidia -v "$PWD"/config.txt:/usr/local/etc/config.txt cedricwalter/docker-xmr-stak-nvidia
```

Use `--privileged` option for large pages support. Large pages need a properly set up OS.

Fetch logs of a container:

```console
$ docker logs some-xmr-stak-nvidia
```

Attach:

```console
$ docker attach some-xmr-stak-nvidia
```

# Image Variants

The images come in two flavors, with and without donation fee.

## `xmr-stak-nvidia:<version>`

This is the defacto image. By default the miner will donate 1% of the hashpower (1 minute in 100 minutes) to dev's pool.

## `xmr-stak-nvidia:nodevfee`

This variant has no donation fee.

# Creating image from source 

Install docker.io with this apt command:
```sudo apt-get install docker.io
```

When the installation is finished, start the docker service and enable it to start at boot time:
```sudo systemctl start docker
sudo systemctl enable docker
```

Docker has been installed and is running on the system.

```git clone https://github.com/cedricwalter/docker-xmr-stak-nvidia.git
cd docker-xmr-stak-nvidia

docker build -t xmr-stak-nvidia .
or
cd nodevfee
docker build -f xmr-stak-nvidia:nodevfee . 
```

# Donations

Donations for work on docker-izing xmr-stak-nvidia are accepted at:

- BTC: `1Lqf1yTu31ENgbVoU6kBPxWGAfeePijQMN`
- XMR: `44KKSLPWY2jLfZkrxN1zzKDhCzW6Fvier44CDkTxz637cd5RTksVqNw1aNSwMrpQ3tSom6P6ej37qDJY7GqzW7rkQjRsruF`
