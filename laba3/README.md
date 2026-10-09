1.1
```bash 
cd ~
mkdir test
cd test
touch file
ls -la
```

1.2
```bash
hmod 000 file
```

1.3
```bash
chmod 200 file
echo "abc" > file
micro file
```

1.4
```bash
echo "abc" > file
micro file
```

1.5
```bash
chmod u+r file
micro file
```

1.6
```bash
mkdir dir
cd dir
ls
```

1.7
```bash
chmod a-x dir
micro dir/new_file
rm dir/new_file
```

1.8
```bash
sudo chown user file
```

1.9
```bash
umask 077
touch newfile
ls -ls
```

1.10
```bash
umask 000
touch newfile1
ls -la
```

1.11
```bash
sudo -i
chown root newfile1
logout
```

1.12
```bash
micro newfile1
sudo chmod g+r newfile1
micro newfile1
```

2.1
```bash
whoami
id
```

2.2
```bash
grep "$USER:" /etc/passwd
```

2.3
```bash
sudo groupadd labgroup
grep "labgroup" /etc/group
```

2.4
```bash
sudo useradd labuser -d /home/test
grep "labuser" /etc/passwd
```

2.5
```bash
sudo passwd labuser
su - labuser
whoami
id
pwd
```

2.6
```bash
touch filik
ls -l filik
```
группа-владелец файла устанавливается та которая является основной группой владельца

2.7
```bash
exit
sudo usermod -aG labgroup labuser
id labuser
su - labuser
id
```
членство в группах фиксируется при входе в систему

2.8
```bash
sudo adduser labuser2
sudo usermod -aG labgroup labuser2
id labuser2
```

2.9
```bash
mkdir /tmp/lab_shared
sudo chown root:labgroup /tmp/lab_shared
sudo chmod 770 /tmp/lab_shared
su - labuser
cd /tmp/lab_shared
touch filr
```

2.10
```bash
exit
su - labuser2
micro filr
echo "a" > filr
rm filr
```

2.11
```bash
sudo chmod 2770 /tmp/lab_shared/
su - labuser
cd /tmp/lab_shared/
touch f1
exit
su - labuser2
cd /tmp/lab_shared/
touch f2
ls -l
```

2.12
```bash


