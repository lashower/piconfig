apt-get upgrade
apt-get update
apt-get -y install gcc make libssl-dev
cd /usr/src
rubyfile=$(curl https://cache.ruby-lang.org/pub/ruby/ | sed 's/<[^>]*>//g' | grep 'ruby-' | grep 'tar.gz' | tail -n1 | awk ' { print $1 } ')
wget "https://cache.ruby-lang.org/pub/ruby/${rubyfile}"
tar -xvzf ${rubyfile}
cd ruby-*
./configure --enable-shared --disable-install-doc --disable-install-rdoc --disable-install-capi
make -j4 ; make install
gem install chef
chef-client --version
