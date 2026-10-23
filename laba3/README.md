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
chmod 000 file
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
mkdir /tmp/obzh
chmod 1777 /tmp/obzh
su - labuser
touch f1 /tmp/obzh
su - labuser2
touch f2 /tmp/obzh
rm /tmp/obzh/f1
```
sticky bit устанавлиает правило - удалять файлы могут только их создатели когда менять и писать все кто хочет
то есть в последней строчке было отказано

2.13
```bash
sudo passwd -l labuser
su - labuser
sudo passwd -u labuser
su - labuser
```

2.14
```bash
sudo chage -l labuser
sudo chage -d 0 labuser
su - labuser
```

2.15
```bash
sudo usermod -s /bin/sh labuser
su - labuser
exit
grep "^labuser:" /etc/passwd
sudo usermod -s /bin/bash labuser
```

2.16
```bash
sudo userdel labuser2
sudo ls -la /home/labuser2
sudo ls -ln /home/labuser2
```
после удаления пользователя его UID больше не связан с каким-либо именем пользователя
система отображает владельца только по числовому UID, потому что не может найти соответствующее имя пользователя

2.17
```bash
cat /etc/passwd
```
у системных учетных записей UID меньше 1000
/sbin домашний каталог

2.18
```bash
cat /etc/login.defs
cat /etc/passwd
```

2.19
```bash
sudo useradd -m testuser
sudo passwd testuser
getent passwd testuser
sudo useradd -r -s /sbin/nologin testsyslem
getent passwd testsystem
```

2.20
```bash
sudo userdel testsystem
sudo useradd -r -m -s /sbin/nologin testsystem
ls -ld /home/testsystem
```
без -m только регистрируется путь к домашнему каталогу а не создается

2.21
```bash
cat /etc/passwd
```

2.22
```bash
sudo usermod -s /sbin/nologin testuser
su - testuser
sudo su -s /bin/bash -c "whoami; id" testuser
```

2.23
```bash
sudo usermod -s /sbin/false testuser
su - testuser
```
нету сообщения о отказе в доступе

2.24
```bash
sudo usermod -s /bin/bash testuser
su - testuser
```

2.25
```bash
sudo usermod -s /bin/echo testuser
su - labuser
```

2.26
```bash
sudo groupadd -r testsystemgroup
sudo groupadd testgroup
getent group testsystemgroup testgroup
```

2.27
```bash
cat /etc/passwd
```

2.28
```bash
sudo useradd -r -g testsystemgroup -M -s /sbin/nologin serviceuser
getent passwd serviceuser
```

2.29
```bash
su - testuser
sudo usermod -s bin/sh testuser
```

2.30
```bash
sudo visudo -f /etc/sudoers.d/testuser-id
```
```nano
testuser ALL=(root) /usr/bin/id
```
```bash
su - testuser
sudo id
sudo usermod -s bin/sh testuser
```

2.31
```bash
sudo visudo -f /etc/sudoers.d/testuser-id
```
```nano
testuser ALL=(root) /usr/bin/id, /usr/bin/whoami
```
```bash
su - testuser
sudo id
sudo whoami
```

2.32
```bash
sudo groupadd testadmins
sudo visudo -f /etc/sudoers.d/testadmins
```
```nano
%testadmins ALL=(root) /usr/bin/id
```
```bash
sudo usermod -aG testadmins testuser
su - testuser
sudo id
exit
sudo gpasswd -d testuser testadmins
su - testuser
sudo id
```

2.33
```bash
cp /etc/login.defs .
cat /etc/login.defs
```

2.34
```bash
sudo sed -i 's/^UID_MIN.*/UID_MIN 2000/' /etc/login.defs
grep '^UID_MIN' /etc/login.defs
sudo useradd -m configuser1
getent passwd configuser1
sudo userdel -r configuser1
sudo mv login.defs /etc/login.defs
grep '^UID_MIN' /etc/login.defs
```

2.35
```bash
sudo sed -i 's/^SYS_UID_MIN.*/SYS_UID_MIN 5000/' /etc/login.defs
sudo sed -i 's/^SYS_UID_MAX.*/SYS_UID_MAX 5010/' /etc/login.defs
sudo useradd -r sysconfig1
sudo useradd -r sysconfig2
sudo useradd -r sysconfig3
getent passwd sysconfig1 sysconfig2 sysconfig3
```

2.36
```bash
sudo sed -i 's/^GID_MIN.*/GID_MIN 5000/' /etc/login.defs
sudo sed -i 's/^GID_MAX.*/GID_MAX 5010/' /etc/login.defs
sudo groupadd configgroup1
getent group configgroup1
sudo groupdel configgroup1
```

2.37
```bash
sudo sed -i 's/^SYS_GID_MIN.*/SYS_GID_MIN 5000/' /etc/login.defs
sudo sed -i 's/^SYS_GID_MAX.*/SYS_GID_MAX 5010/' /etc/login.defs
sudo groupadd -r sysgroup1
sudo groupadd -r sysgroup2
sudo groupadd -r sysgroup3
getent group sysgroup1 sysgroup2 sysgroup3
sudo groupdel sysgroup1 sysgroup2 sysgroup3
```

2.38
```bash
sudo sed -i 's/^CREATE_HOME.*/CREATE_HOME yes/' /etc/login.defs
sudo useradd homeuser1
ls -ld /home/homeuser1
sudo sed -i 's/^CREATE_HOME.*/CREATE_HOME     no/' /etc/login.defs
sudo useradd homeuser2
ls -ld /home/homeuser2 
sudo userdel -r homeuser1
sudo userdel homeuser2
```

2.39
```bash
grep '^CREATE_HOME' /etc/login.defs
sudo useradd -r syshome1
ls -ld /home/syshome1
sudo useradd -r -m syshome2
ls -ld /home/syshome2
```

2.40
```bash
sudo useradd -m umaskuser1
ls -ld /home/umaskuser1
sudo sed -i 's/^HOME_MODE.*/HOME_MODE  0700/' /etc/login.defs
sudo useradd -m umaskuser2
ls -ld /home/umaskuser2
sudo userdel -r umaskuser1 umaskuser2
```

2.41
```bash
sudo useradd -m uguser1
getent group uguser1
getent passwd uguser1
sudo sed -i 's/^USERGROUPS_ENAB.*/USERGROUPS_ENAB no/' /etc/login.defs
sudo useradd -m uguser2
getent group uguser2
getent passwd uguser2
sudo userdel -r uguser1 uguser2
```

2.42
```bash
sudo sed -i 's/^SHELL.*/SHELL \/bin\/sh/' /etc/login.defs
sudo useradd defaultuser1
getent passwd defaultuser1
sudo userdel defaultuser1
```

2.43
```bash
sudo sed -i 's|^HOME=.*|HOME=/users|' /etc/default/useradd
sudo mkdir -p /users
sudo useradd -m defaultuser2
getent passwd defaultuser2
ls -ld /users/defaultuser2
sudo userdel -r defaultuser2
```
