# squid4
<p>udah pada mamam belum? <br>
<p>mamam dulu atuh bisi salatri </p>
<p>I use ubuntu 15.04 in session to install this squid4<br>
my server proxy ip address 192.168.1.200<br>
you can adjust or replace the ip address you on the config below :<br>
-unbound.conf ---->  replace with the your IP address and domain <br>
-squid.conf ----> replace with your ip address<br>
-rc.local</p>
<p>local repostiroy ubuntu 15.04:<br>
Indonesia:<br>
deb http://id.archive.ubuntu.com/ubuntu/ vivid main restricted universe multiverse<br> 
deb http://id.archive.ubuntu.com/ubuntu/ vivid-security main restricted universe multiverse <br>
deb http://id.archive.ubuntu.com/ubuntu/ vivid-updates main restricted universe multiverse<br>
Kambing.ui.ac.id:<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-updates main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-security main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-backports main restricted universe multiverse<br>
deb http://kambing.ui.ac.id/ubuntu/ vivid-proposed main restricted universe multiverse<br>
debian 8 jessie
deb http://kambing.ui.ac.id/debian/ jessie main contrib non-free<br>
deb http://kambing.ui.ac.id/debian/ jessie-updates main contrib non-free<br>
deb http://kambing.ui.ac.id/debian-security/ jessie/updates main contrib non-free<br>
</p>
<p>already finish installation server,webserver<br>
<p>apt-get update && apt-get upgrade -y<br>
<p>and install git<br>
apt-get install git g++-4.4 -y or<br>
on debian 7-8 --> apt-get install git-all <br>
<p style="font-weight:bold;">git clone https://github.com/puji122/squid4.git<br>
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
