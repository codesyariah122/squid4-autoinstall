# squid4
<p>udah pada mamam belum? <br>
<p>mamam dulu atuh bisi salatri </p>
<p>I use ubuntu 15.04 in session to install this squid4<br>
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
</p>
<p>already finish installation server,webserver<br>
<p>apt-get update && apt-get upgrade -y<br>
<p>and install git<br>
apt-get install git g++-4.4 -y<br>
<p>git clone https://github.com/puji122/squid4.git<br>
<p>cd squid4</p<<br>
<p>chmod +x squid4.sh<br>
<p>./squid4.sh</p>
#==========================================<br>
<p>after reboot <br>
delete dns-nameserver /etc/network/interfaces or comment #dns-nameserver<br>
<p>/etc/init.d/networking restart<br>
squid -k reconfigure<br>
<p>/etc/init.d/squid restart<br>
/etc/init.d/unbound restart<br>
<p>dig google.com<br>
unbound-control stats tail -16<br>
tail -f /var/log/squid/access.log</p>
