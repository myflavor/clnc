apk add proxychains-ng
sed -i '$d' /etc/proxychains/proxychains.conf
sed -i '$s/.*/http 127.0.0.1 6650/' /etc/proxychains/proxychains.conf
wget https://cdn.jsdelivr.net/gh/myflavor/clnc@master/proxy.zip
rm -rf /etc/clnc
mkdir /etc/clnc
unzip proxy.zip -d /etc/clnc
rm -rf proxy.zip
chmod +x /etc/clnc/clnc
rm -rf /usr/local/bin/clnc
echo "/etc/clnc/clnc -c /etc/clnc/clnc.conf" >> /usr/local/bin/clnc
chmod +x /usr/local/bin/clnc
sed -i 's/^EnableExtraShell=.*/EnableExtraShell="true"/g' /jd/config/config.sh
sed -i 's/node /proxychains -q node /g' jd.sh
echo "sed -i 's/node /proxychains -q node /g' jd.sh" >> /jd/config/diy.sh
clnc
