#!/bin/bash

# Curl
sudo apt-get update
sudo apt-get install curl
curl --version

# install docker
echo "Started: Install docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
docker --version
echo "Done: Install docker"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#install docker compose

echo "Started: Install docker compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant
docker --version
docker-compose --version

sudo apt-get install docker-ce
echo "Done: Install docker compose"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#Install go path
echo "Started: Install GO"
curl -O https://storage.googleapis.com/golang/go1.14.6.linux-amd64.tar.gz
sudo tar xvf go1.14.6.linux-amd64.tar.gz
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
sudo mv go/ /usr/local

go version

echo "Done: Install GO"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#node
echo "Started: Install Node"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
echo "Done: Install Node"
#python
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "Started: Install Python"
sudo apt-get install python
python --version

echo "Done: Install Python"
#python
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

# pull Fabric images
sudo -i
echo "Started: Pull Hyperledger Fabric"
sudo curl -sSL https://bit.ly/2ysbOFE | bash -s 
export PATH=/home/vagrant/fabric-samples/bin:$PATH
sudo apt-get install build-essential checkinstall 
make gotools
make basic-checks integration-test-prereqs
ginkgo -r ./integration/nwo
export PATH=$PATH:/usr/local/go/bin:/home/vagrant/.go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/vagrant/fabric-samples/bin
export GOROOT=/usr/vagrant/go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=/usr/local/go 
export PATH=$PATH:$GOPATH/bin 
echo "End: Pull Hyperledger Fabric"
echo "DONE: Everything installed"
# IPFS install
echo "Started: IPFS install"
wget https://github.com/ipfs/go-ipfs/releases/download/v0.6.0/go-ipfs_v0.6.0_linux-amd64.tar.gz
tar -xvzf go-ipfs_v0.6.0_linux-amd64.tar.gz
cd go-ipfs
sudo bash install.sh
ipfs --version
ipfs init
echo "End: IPFS install"

#Install Java
echo "Started: Install Java"
sudo apt install default-jre
java -version
sudo apt install maven
mvn -version
sudo apt install gradle
echo "End: Java Install"

export PATH=$PATH:/home/vagrant/fabric-samples/config
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
