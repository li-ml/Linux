
#!/usr/bin/expect -f
set date [exec date "+%Y-%m-%d"]
# =========================================================
# 变量区域，仅修改此处
set basedir /home/client/bak
set srcdir /home/client/src/webapp

set remoteServer root@10.41.242.28:/home/bakup/app.db.$date.zip
set remoteServerPwd "root123 \r"
# ===========================================================
set zipfile $basedir/app.db.$date.zip

spawn  [ ! -d "$basedir" ] && mkdir $basedir


spawn  cd $srcdir
spawn   zip -r $zipfile ./*


# ===========================================================
# copy to remote server
# scp /home/space/music/1.mp3 root@www.cumt.edu.cn:/home/root/others/music
spawn scp $zipfile $remoteServer
expect "*password:"
send $remoteServerPwd
expect eof
