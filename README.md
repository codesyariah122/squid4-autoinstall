# squid4
<p>udah pada mamam belum? <br>
<p>mamam dulu atuh bisi salatri </p>
<p>I use ubuntu 15.04 in session to install this squid4<br>
my ip address proxy server  192.168.1.200<br>
dns-nameservers 192.168.1.1 gateway 192.168.1.1<br>
you can adjust or replace  ip address on the config below :<br>
-unbound.conf ---->  replace with the your IP address and domain <br>
-squid.conf ----> replace with your ip address<br>
-rc.local</p>
<p>local repostiroy ubuntu 15.04:<br>
Indonesia-repository:<br>
deb http://id.archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse<br> 
deb http://id.archive.ubuntu.com/ubuntu/ vivid-security main restricted universe multiverse <br>
deb http://id.archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse<br>
local-repository-Kambing.ui.ac.id:<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-updates main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-security main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-backports main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-proposed main restricted universe multiverse<br>
</p>
<p>already finish installation server,webserver<br>
<p>apt-get install lsb-release -y </p><br>
<p>and install git<br>
apt-get install git g++-4.4 -y<br>
<p style="font-weight:bold;">git clone https://github.com/puji122/squid4-autoinstall.git<br>
<p style="font-weight:bold;">cd squid4-autoinstall</p<<br>
<p style="font-weight:bold;">chmod +x squid4.sh<br>
<p style="font-weight:bold;">./squid4.sh</p>
#==========================================<br>
<p>after reboot <br>
delete dns-nameservers di /etc/network/interfaces or comment #dns-nameservers<br>
<p>/etc/init.d/networking restart<br>
squid -k reconfigure<br>
<p>/etc/init.d/squid restart<br>
/etc/init.d/unbound restart<br>
<p>dig google.com<br>
unbound-control stats tail -16<br>
tail -f /var/log/squid/access.log</p>


*notification :<br>
fyi install the package maintainer's version<br>
choose : <br>
if the notification appears when installing software<br>
__________________________________________________________________________________________________________________________
