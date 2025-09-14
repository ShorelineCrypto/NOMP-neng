# Installation Guide for NOMP-neng

For high level understanding of NOMP pool configuration and setup, please checkout file "orig-README.md" which explains well on understanding of the pool software.

Specifically, for NOMP-neng software set up, please follow below steps to start nengcoin and cheetahcoin solo mining pool at home quickly after obtaining the repo code.


## Requirement - Linux, Docker
The source code NOMP-neng has been successfully tested in Ubuntu 18.04/20.04/22.04, MX Linux / Debian bookworm with docker and docker-compose installed.
Windows or MacOS os has never been tested, but can be adapted to use this code when their appropriate docker and docker-compose dependencies are met on x64 hardware.

In general in ubuntu or debian linux, please follow below to install docker:
```
  sudo apt-get update
  sudo apt-get install docker.io
  sudo apt-get install docker-compose
```

## Step 1 - build/run redis docker images
After finishing docker depenencies installation, obtain source code at user home directory:
```
  cd ~
  git clone https://github.com/ShorelineCrypto/NOMP-neng.git
  cd NOMP-neng/redis
  docker-compose up -d

```

This will build redis docker images and nomp-neng main docker image required for running NOMP-neng and run redis container.

Because of "redis" container hostname is unknown by NOMP-neng, below is required in host to avoid hostname redis error when NOMP-neng runs:
```
sudo echo "127.0.0.1       redis" >> /etc/hosts
```

## Step 2 - build/run main nomp-neng docker images

To build your own nomp-neng images, run below:

```
  cd ~/NOMP-neng
  docker build -t nomp-neng .
```

Alternatively, you can download a working docker image from docker hub:

```
  docker pull shorelinecrypto/nomp-neng:latest
  docker tag shorelinecrypto/nomp-neng:latest nomp-neng
```

## Step 3 - Start Nengcoin/Cheetahcoin Full Node

Download Nengcoin latest core wallet and configure the daemon in host:

```
  wget https://github.com/ShorelineCrypto/nengcoin/releases/download/v2.4.0/nengcoin_2.4.0_x86_64_linux-gnu.tgz
  tar xvfz nengcoin_2.4.0_x86_64_linux-gnu.tgz
  mkdir ~/.nengcoin
  cp nengcoin.conf-example ~/.nengcoin/nengcoin.conf
```

Use your favorite linux editor, modify the file ~/.nengcoin/nengcoin.conf and customize on rpcuser,  rpcpassword, rpcport for your own pool case.
Make sure the field values match the pool configuration file at ~/NOMP-neng/config/pool_configs/nengcoin.json later.

Start NENG daemon in the host:
```
  ~/nengcoin_2.4.0_x86_64_linux-gnu/nengcoind
```

Perform similar procedure for cheetahcoin, download v2.4.0 core software in host:

```
  wget https://github.com/ShorelineCrypto/cheetahcoin/releases/download/v2.4.0/cheetahcoin_2.4.0_x86_64_linux-gnu.tgz
  tar xvfz cheetahcoin_2.4.0_x86_64_linux-gnu.tgz
  mkdir ~/.cheetahcoin
  cp cheetahcoin.conf-example ~/.cheetahcoin/cheetahcoin.conf
```
Use your favorite linux editor, modify the file ~/.cheetahcoin/cheetahcoin.conf and customize on rpcuser,  rpcpassword, rpcport for your own pool case.
Make sure the field values match the pool configuration file at ~/NOMP-neng/config/pool_configs/cheetahcoin.json later.


Note that Nengcoin/Cheetahcoin core can run multiple daemons in the sever with different rpcport and data port. Without specifying in nengcoin.conf file, the default nengcoin
rpcport is 6376 and data port is 6377. For example,  a second Nengcoin daemon at ~/.nengcoin3 folder can have below start script:
```
  ./nengcoind -port=8377  -rpcport=8376 -datadir=${HOME}/.nengcoin3
```

Without specifying in cheetahcoin.conf file, the default rpcport is 8536 and data port is 8537. For example, a second cheetahcoin full node at ~/.cheetahcoin3 folder:
```
  ./cheetahcoind -port=8547 -rpcport=8546 -datadir=${HOME}/.cheetahcoin3
```

Wait until the nengcoin and cheetahcoin daemon finishes wallet full node blockchain syncing and CPU usage will go to almost zero. 

## Step 4 - Configure pool on Nengcoin/Cheetahcoin

Ran below:
```
  cd ~/NOMP-neng/config/pool_configs/
  cp nengcoin.json-example nengcoin.json
  cp cheetahcoin.json-example cheetahcoin.json
```

Use editor to modify the file nengcoin.json and/or cheetahcoin.json, change the pool NENG/CHTA receiving address to your own pool address. Make sure the rpcport, rpcuser, rpcpassword also match that in your nengcoin.conf and/or cheetahcoin.conf daomon configuration file.
Customize pool difficulty setup as needed.

## Step 5 - Start NOMP-neng container

3 shell example scripts are provded in this repo: `run_nomp_cheetah.sh`  `run_nomp_dualmining.sh`  `run_nomp_neng.sh`. 

now start NOMP-neng as below command for Nengcoin:
```
  cd ~/NOMP-neng
  docker run --net host -d --name nomp -p 8376:8376 -v ${HOME}/.nengcoin:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
```

In case ~/.nengcoin3 alternative second NENG wallet daemon is used as show above, ran below to start instead:
```
  docker run --net host -d --name nomp -p 8376:8376 -v ${HOME}/.nengcoin3:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
```

For a pool setup dual mining both nengcoin and cheetahcoin, run command as below:
```commandline
  docker run --net host -d --name nomp -p 8546:8546 -v ${HOME}/.cheetahcoin3:/root/.cheetahcoin -p 8388:8388 -v ${HOME}/.nengcoin3:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
```

Check your NOMP-neng health with docker:
```
  docker logs nomp
```
The log should show good results. If you see redis hostname error, make sure to run step 1 fix on this issue. 

## Step 6 - Start/Monitor NENG solo/private pool mining

Found your home linux server private IP address, and in browser the NOMP-neng pool can be accessed at URL
"http://yourPrivateIP.address:8080"

The rest would be just like any public pool mining. Point your scrypt miner rig for CPU, GPU, USB ASIC or ASIC to this private pool. Enjoy Nengcoin/Cheetahcoin solo mining and help along Nengcoin/Cheetahcoin decentralization with profit!
