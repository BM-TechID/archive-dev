#!/bin/bash

cd cc-miner
cat << 'EOF' > luckpool.sh
#!/bin/bash
./cc-miner/ccminer -a verus -o stratum+tcp://ap.luckpool.net:3960 -u R9jHe6UJaZi4Bzq4FaiQzk6RbJ6cif81cT.STB-B860H-18 -t 4
EOF
cat << 'EOF' > vipor.sh
#!/bin/bash
./cc-miner/ccminer -a verus -o stratum+tcp://sg.vipor.net:5040 -u R9jHe6UJaZi4Bzq4FaiQzk6RbJ6cif81cT.STB-B860H-18 -p x -t 4
EOF

ls
sleep 3

wget https://github.com/Oink70/ccminer-verus/releases/download/v3.8.3a-CPU/ccminer-v3.8.3c-oink_ARM
mv ccminer* ccminer
apt install libomp5 -y
sleep 10
echo "Terinstall boss..."
chmod +x * && ls
sleep 3
rm autoping*

crontab -r
cat << 'EOF' | crontab -
@reboot screen -dmS vipor /root/cc-miner/vipor.sh
@reboot screen -dmS luckpool /root/cc-miner/luckpool.sh
0 */2 * * * /sbin/shutdown -r now
EOF

crontab -l
sleep 5
reboot
