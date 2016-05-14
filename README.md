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
─┤ Modified configuration file ├─────────────────────────────────────────────┐<br>
 │ A new version (/etc/kernel-img.conf.ucf-new) of configuration file /etc/kernel-img.conf is available, but the version  │<br>
 │ installed currently has been locally modified.                                                                         │<br>
 │                                                                                                                        │<br>
 │ What do you want to do about modified configuration file kernel-img.conf?                                              │<br>
 │                                                                                                                        │<br>
 │                                  install the package maintainer's version                                              │<br>
 │                                  keep the local version currently installed                                            │<br>
 │                                  show the differences between the versions                                             │<br>
 │                                  show a side-by-side difference between the versions                                   │<br>
 │                                  start a new shell to examine the situation                                            │<br>
 │                                                                                                                        │<br>
 │                                                                                                                        │<br>
 │                                                         <Ok>                                                           │<br>
 │                                                                                    
