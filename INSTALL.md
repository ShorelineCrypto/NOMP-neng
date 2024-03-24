# Installation Guide for NOMP-neng

For high level understanding of NOMP pool configuration and setup, please checkout file "orig-README.md" which explains well on understanding of the pool software.

Specifically, for NOMP-neng software set up, please follow below steps to start Nengcoin solo mining pool at home quickly after obtaining the repo code.


## Requirement - Linux, Docker
The source code NOMP-neng has been successfully tested in Ubuntu 18.04 / 20.04, MX Linux / Debian bookworm with docker and docker-compose installed.
Windows or MacOS os has never been tested, but can be adapted to use this code when their appropriate docker and docker-compose dependencies are met.

In general in ubuntu or debian linux, please follow below to install docker:
```
  sudo apt-get update
  sudo apt-get install docker.io
  sudo apt-get install docker-compose
```

## Step 1 - build docker images / run redis
After finishing docker depenencies installation, obtain source code at user home directory:
```
  cd ~
  git clone https://github.com/ShorelineCrypto/NOMP-neng.git
  cd NOMP-neng/redis
  docker-compose up -d
  cd ..
  docker build -t nomp-neng .
```

This will build redis docker images and nomp-neng main docker image required for running NOMP-neng and run redis container.

Because of "redis" container hostname is unknown by NOMP-neng, below is required in host to avoid hostname redis error when NOMP-neng runs:
```
sudo echo "127.0.0.1       redis" >> /etc/hosts
```


## Step 2 - Start nengcoin daemon

Download Nengcoin latest core wallet and configure the daemon in host:

```
  wget https://github.com/ShorelineCrypto/nengcoin/releases/download/v2.3.0/nengcoin_2.3.0_x86_64_linux-gnu.tgz
  tar xvfz nengcoin_2.3.0_x86_64_linux-gnu.tgz
  mkdir ~/.nengcoin
  cp nengcoin.conf-example ~/.nengcoin/nengcoin.conf
```

Use your favorite linux editor, modify the file "~/.nengcoin/nengcoin.conf" and customize on rpcuser,  rpcpassword, rpcport for your own pool case.
Make sure the field values match the pool configuration file at "~/NOMP-neng/config/pool_configs/nengcoin.json" later.

Start NENG daemon in the host:
```
  ~/nengcoin_2.3.0_x86_64_linux-gnu/nengcoind
```

Note that Nengcoin core can run multiple daemons in the sever with different rpcport and data port. Without specifying in nengcoin.conf file, the default nengcoin
rpcport is 6376 and data port is 6377. For example,  a second Nengcoin daemon at ~/.nengcoin3 folder can have below start script:
```
  ./nengcoind -port=8377  -rpcport=8376 -datadir=${HOME}/.nengcoin3
```

Wait until the nengcoin daemon finishes wallet full node syncing and CPU usage will go to almost zero.

## Step 3 - Configure Nengcoin pool

Ran below:
```
  cd ~/NOMP-neng/config/pool_configs/
  cp nengcoin.json-example nengcoin.json
```

Use editor to modify the file nengcoin.json, change the pool NENG receiving address to your own pool address. Make sure the rpcport, rpcuser, rpcpassword also match that in your nengcoin.conf daomon configuration file.
Customize pool difficulty setup as needed.

## Step 4 - Start NOMP-neng container

now start NOMP-neng as below command:
```
  cd ~/NOMP-neng
  docker run --net host -d --name nomp -p 8376:8376 -v ${HOME}/.nengcoin:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
```

In case ~/.nengcoin3 alternative second NENG wallet daemon is used as show above, ran below to start instead:
```
  docker run --net host -d --name nomp -p 8376:8376 -v ${HOME}/.nengcoin3:/root/.nengcoin -v $(pwd)/config:/opt/config nomp-neng
```

Check your NOMP-neng health with docker:
```
  docker logs nomp
```
The log should show good results. If you see redis hostname error, make sure to run step 1 fix on this issue. 

## Step 5 - Check and start NENG solo pool mining

Found your home linux server private IP address, and in browser the NOMP-neng pool at be accessed at URL
"http://yourPrivateIP.address/"

The rest would be just like any public pool mining. Point your USB ASIC or ASIC to this pool. Enjoy Nengcoin solo mining and help along Nengcoin decentralization with profit!