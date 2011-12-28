#ubuntu10.04 server
#base on http://ihower.tw/rails3/installation.html

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install git-core
sudo apt-get install build-essential zlib1g-dev libssl-dev libreadline5-dev

wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar xvfz ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290/
./configure
make
sudo make install

sudo apt-get install sqlite3 libsqlite3-dev

sudo gem update --system 

sudo gem install sqlite3 --no-ri --no-rdoc

sudo gem install rails --no-ri --no-rdoc

sudo gem install rails -v 3.1.3 --no-ri --no-rdoc
