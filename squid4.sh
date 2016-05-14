#!/bin/bash
read -p 'Masukan User Linux Anda: ' userver
read -sp 'password Linux Anda: ' passserver 
echo "Aku Yakin Kamu pasti bisa" 
echo -e "selamat datang $userver di program installasi proxy\n"
echo -n "Masukan Nama Anda :"
read nama
echo "Hello $nama"
echo "goodluck $nama"
echo "|=====================================================|"
echo "|                   Sajak Suara                       |"
echo "|=====================================================|"
echo "|     sesungguhnya suara itu tak bisa diredam         |"
echo "|                mulut bisa dibungkam                 |"
echo "|  namun siapa mampu menghentikan nyanyian bimbang    |" 
echo "|    dan pertanyaan-pertanyaan dari lidah jiwaku      |"
echo "|      suara-suara itu tak bisa dipenjarakan          |"
echo "|          di sana bersemayam kemerdekaan             |"
echo "|           apabila engkau memaksa diam               |"
echo "|       akan kusiapkan untukmu: pemberontakan!        |" 
echo "|                                                     |"
echo "|        sesungguhnya suara itu bukan perampok        |"
echo "|             yang ingin meraih hartamu               |" 
echo "|                 ia ingin bicara                     |" 
echo "|            mengapa kau kokang senjata               |"
echo "|         dan gemetar ketika suara-suara itu          |"
echo "|                menuntut keadilan?                   |"
echo "|                                                     |"
echo "|       sesungguhnya suara itu akan menjadi kata      |"
echo "|          ialah yang mengajari aku bertanya          |"
echo "|          dan pada akhirnya tidak bisa tidak         |" 
echo "|                engkau harus menjawabnya             |"
echo "|            apabila engkau tetap bertahan            |"
echo "|         aku akan memburumu seperti kutukan          |"
echo "|           Wiji Thukul - 1996 (Sajak Suara)          |" 
echo "|=====================================================|"
echo "Informasi Sistem"                                                         
# informasi perangkat keras                                                     
echo "++ Perangkat keras "                                                      
CPU=`grep "model name" /proc/cpuinfo | head -n 1 | cut -f 2 -d ':'`             
RAM=`grep "MemTotal" /proc/meminfo | cut -f 2 -d ':'`                           
echo " |- CPU : " $CPU                                                          
echo " |- RAM : " $RAM                                                          
echo "++ Sistem Operasi "                                                       
# informasi sistem operasi                                                      
OS=`uname -sr`                                                                  
echo " |- OS : " $OS                                                            
echo " |- Shell : " $SHELL
echo -n "Waktu system   :"; date
echo -n "Distro Info    :"; lsb_release -a
echo -n "Anda           :"; whoami
echo -n "Banyak pemakai :"; who | wc -l
echo "ok langsung ajah"
echo "Jangan lupa kopinya sebagai partner kerja yang tangguh"

cp sysctl.conf /etc/sysctl.conf
cp limits.conf /etc/security/limits.conf
cp modules /etc/modules

apt-get update && apt-get upgrade -y

apt-get install devscripts build-essential openssl libssl-dev fakeroot libcppunit-dev pkg-config libsasl2-dev cdbs ebtables bridge-utils libcap2 libcap-dev libcap2-dev sysv-rc-conf iproute kernel-package libncurses5-dev fakeroot wget bzip2 debhelper linuxdoc-tools libselinux1-dev htop iftop dnstop perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python ccze pastebinit checkinstall libssl-dev htop iftop iptraf mtr-tiny bwm-ng ccze sysv-rc-conf devscripts build-essential openssl libssl-dev fakeroot libcppunit-dev libsasl2-dev cdbs ccze libfile-readbackwards-perl libcap2 libcap-dev libcap2-dev libnetfilter-conntrack-dev libfile-readbackwards-perl -y

tar -xvzf libsodium-0.7.0.tar.gz

cd libsodium-0.7.0
./configure && make && make install

cd -
tar -xzvf dnscrypt-proxy-1.4.0.tar.gz

cd dnscrypt-proxy-1.4.0
./configure && make && make install
ln -s /usr/local/lib/libsodium.so.13 /usr/lib/libsodium.so.13
/usr/local/sbin/dnscrypt-proxy -a 127.0.0.1:40 -d -R d0wn-sg-ns1 -e 4096 -p /run/dnscrypt-proxy.pid
netstat -tapen | grep ":40 "

cd -
cp rc.local /etc/rc.local
apt-get install unbound -y
cp named.cache /etc/unbound/named.cache
cp unbound.conf /etc/unbound/unbound.conf

cd /etc/unbound
unbound-control-setup && groupadd unbound && useradd -d /var/unbound -m -g unbound -s /bin/false unbound
chown unbound:root unbound_* && chmod 440 unbound_*
killall unbound
/etc/init.d/unbound stop
/etc/init.d/unbound restart

cd -
tar -xzf libecap-1.0.0.tar.gz
cp DSI_ecap_youtube.so /usr/local/lib/
cd libecap-1.0.0
./configure && make && make install
echo '/usr/local/lib' >> /etc/ld.so.conf
ldconfig

cd -
tar -xzf ecap_adapter_sample-1.0.0.tar.gz
cp patch_ecap_adapter_sample.patch ecap_adapter_sample-1.0.0/
cd ecap_adapter_sample-1*
patch -p1 < patch_ecap_adapter_sample.patch
./configure && make && make install

cd -
tar -xzvf squid-4.0.4.tar.gz
cd squid-4.0.4
./configure '--prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/lib/squid' '--sysconfdir=/etc/squid' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--datadir=/usr/share/squid' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-dependency-tracking' '--disable-strict-error-checking' '--enable-async-io=24' '--with-aufs-threads=24' '--with-pthreads' '--enable-storeio=aufs,diskd' '--enable-removal-policies=lru,heap' '--with-aio' '--with-dl' '--disable-icmp' '--enable-esi' '--disable-icap-client' '--disable-wccp' '--disable-wccpv2' '--enable-kill-parent-hack' '--enable-cache-digests' '--disable-select' '--enable-http-violations' '--enable-linux-netfilter' '--enable-follow-x-forwarded-for' '--disable-ident-lookups' '--enable-x-accelerator-vary' '--enable-zph-qos' '--with-default-user=proxy' '--with-logdir=/var/log/squid' '--with-pidfile=/var/run/squid.pid' '--with-swapdir=/cache/cache' '--with-openssl' '--with-large-files' '--enable-ltdl-convenience' '--with-filedescriptors=65536' '--with-maxfd=65536' '--enable-storeid-rewrite-helpers' '--enable-ecap' '--enable-ssl-crtd' '--enable-err-languages=English' '--enable-default-err-language=English' '--build=x86_64' 'build_alias=x86_64' 'PKG_CONFIG_PATH=/usr/local/lib/pkgconfig'
make && make install

cd -
cp squid.conf /etc/squid/
cp squid-cache.txt /etc/squid/
cp squid-cache /etc/squid/
cp squidrewrite /etc/squid/
cp squid /etc/init.d/

cd /etc/init.d/
chmod +x /etc/init.d/squid
update-rc.d squid defaults
/etc/init.d/squid stop

cd -
chmod 755 /etc/squid/squid-cache
chown root.root /etc/squid/squid-cache
chown proxy.proxy /etc/squid/squid-cache
chmod 644 /etc/squid/squid-cache.txt
chown root.root /etc/squid/squid-cache.txt
chown proxy:proxy /etc/squid/squid-cache.txt
chmod 755 /etc/squid/squidrewrite
chown root.root /etc/squid/squidrewrite
chown proxy:proxy /etc/squid/squidrewrite

cd
chown -R proxy:proxy /cache/cache/
chmod -R 777 /cache/cache/
cd /var/log/squid/
touch access.log 
touch cache.log

cd
chown -R proxy:proxy /var/log/squid/
chmod -R 777 /var/log/squid/
mkdir /etc/squid/ssl_certs/

cd /etc/squid/ssl_certs/
openssl genrsa -out squid.key 2048
openssl req -new -key squid.key -out squid.csr -nodes -subj "/C=ID/ST=Jakarta/L=Jakarta/O=Hipster/CN=Young Hipster"
openssl x509 -req -days 3652 -in squid.csr -signkey squid.key -out squid.crt

cd
/usr/lib/squid/ssl_crtd -c -s /etc/squid/ssl_db
chown -R nobody /etc/squid/
chown -R proxy:proxy /etc/squid/
chmod -R 777 /etc/squid/
echo "buat direktory cache"
squid -z
echo "================================================================"
echo "untuk mikrotiknya ="
echo "================================================================"
echo "add ipproxy in address_list= /ip firewall address list= ipproxy name= proxy
/ip routes
add gateway = ip proxy
distance = 1
scope = 30
target scope = 10
routing_mark = via_squid"

echo "================================================================"
echo "/ip firewall mangle
add chain = prerouting
dst.address = !ip proxy/subnet
protocol = tcp
any port = 80,182,443
in interface = !proxy
add action = mark-routing
new routing mark =  via squid"

echo "================================================================"
echo "setelah reboot"
echo "squid -k reconfigure"
echo "/etc/init.d/squid restart"
echo "jangan lupa konfigurasi /etc/network/interface dan pada bagian dns-nameservers di kosongkan atau beri komen tanda pagar#"
echo "/etc/init.d/networking restart"
echo "unbound-control stats"
echo "unbound-control stats | tail -16"
echo "tail -f /var/log/squid/access.log | ccze"
echo -e "Instalasi Unbound dan Squid telah selesai. Agar dapat berjalan, \nsebaiknya restart server anda."
while true; do
    read -p "Serius Lo Mau Di restart...,Pilih Yes Or No?" yn
    case $yn in
        [Yy]* ) init 6; break;;
        [Nn]* ) exit;;
        * ) echo "Tolong jawab yes atau no";;
    esac
done
