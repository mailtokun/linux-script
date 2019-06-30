!/bin/bash
# Debian / Ubuntu Linux Delete Old Kernel Images Command
rm -rf fix_boot_disk.sh
echo "#!/bin/bash" > fix_boot_disk.sh
echo "kill -9 $(ps -ef | grep apt-get | grep -v grep |awk '{print $2}') > /dev/null 2>&1" >> fix_boot_disk.sh
sudo dpkg --configure -a
echo -n "apt-get remove " >> fix_boot_disk.sh
dpkg --get-selections | \
  grep 'linux-image*' | \
  awk '{print $1}' | \
  egrep -v "linux-image-$(uname -r)|linux-image-generic" | \
  while read n
  do
    echo -n "$n " >> fix_boot_disk.sh
  done

echo
echo "echo \"done !!!\"" >> fix_boot_disk.sh
echo "df -h" >> fix_boot_disk.sh
chmod 755 fix_boot_disk.sh
echo "please run fix_boot_disk.sh script. you are welcome! "
echo "                                                 Kun!"
