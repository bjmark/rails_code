sudo gvim /etc/apt/sources.list

#add following line at bottom of the file
deb http://downloads.mongodb.org/distros/ubuntu 10.4 10gen

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

sudo apt-get update

sudo apt-get install mongodb-stable

