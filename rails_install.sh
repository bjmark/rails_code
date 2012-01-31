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

#sudo gem install rails --no-ri --no-rdoc

sudo gem install rails -v 3.1.3 --no-ri --no-rdoc


#deploy cheil with apache and passenger#
sudo gem install passenger
sudo passenger-install-apache2-module

#follow the guide

cd rails_projects
sudo chgrp -R www-data cheil

#copy web_app_theme files from gem to cheil
rails g web_app_theme:assets

bundle exec rake assets:precompile

#edit config/environments/production.rb
config.asserts.compile = true

###install nginx
#reference to http://nginx.org/en/download.html
#For Ubuntu 10.04 append the following to the end of the /etc/apt/sources.list file:

deb http://nginx.org/packages/ubuntu/ lucid nginx
deb-src http://nginx.org/packages/ubuntu/ lucid nginx

sudo apt-get update

#W: GPG error: http://nginx.org lucid Release: 由于没有公钥，无法验证下列签名： NO_PUBKEY ABF5BD827BD9BF62
#http://mailman.nginx.org/pipermail/nginx/2011-December/030918.html

wget http://nginx.org/packages/keys/nginx_signing.key

cat nginx_signing.key | sudo apt-key add -

#this time should be ok
sudo apt-get update
apt-get install nginx

sudo gem install passenger

#follow the instructions
sudo passenger-install-nginx-module

sudo vim /opt/nginx/conf/nginx.conf

sudo /opt/ngnix/sbin/nginx

cd cheil
bundle exec rake asserts:precompile

vim /config/environments/production.rb
config.assets.compile = true

#restart rails
touch tmp/restart.txt

