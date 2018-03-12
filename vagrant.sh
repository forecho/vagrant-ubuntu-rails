#!/usr/bin/env bash
# ==================== INSTALLATION =========================

# 替换国内资源包

sudo rm -r /etc/apt/sources.list
echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list

locale-gen zh_CN.UTF-8
sudo apt-get update > /dev/null

# 安装需要的库和软件
sudo apt-get install -y git-core curl nodejs zlib1g-dev build-essential \
                     libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
                     libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common

sudo apt-get autoremove -y

# 安装 rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 使用 Ruby China 的镜像安装 Ruby
git clone https://github.com/andorchen/rbenv-china-mirror.git /home/vagrant/.rbenv/plugins/rbenv-china-mirror

# 安装 ruby
sudo -H -u vagrant bash -i -c 'rbenv install 2.5.0'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
sudo -H -u vagrant bash -i -c 'rbenv global 2.5.0'
sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# gem 操作 && 安装 rails && 换源
sudo -H -u vagrant bash -i -c 'echo "gem: --no-ri --no-rdoc" > ~/.gemrc'
sudo -H -u vagrant bash -i -c 'gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/'
sudo -H -u vagrant bash -i -c 'gem sources -l'
sudo -H -u vagrant bash -i -c 'bundle config mirror.https://rubygems.org https://gems.ruby-china.org'
sudo -H -u vagrant bash -i -c 'gem install rails'
sudo -H -u vagrant bash -i -c 'rails -v'

# 安装 MySQL
sudo apt-get install mysql-client libmysqlclient-dev -y
sudo apt-get install debconf-utils -y
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install mysql-server -y

# install autojump https://github.com/wting/autojump
git clone git://github.com/joelthelion/autojump.git /home/vagrant/autojump
sudo -H -u vagrant bash -i -c 'cd /home/vagrant/autojump && ./install.py'
sudo -H -u vagrant bash -i -c 'echo "[[ -s /home/vagrant/.autojump/etc/profile.d/autojump.sh ]] && source /home/vagrant/.autojump/etc/profile.d/autojump.sh">> /home/vagrant/.bashrc'