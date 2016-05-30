
#!/bin/bash
# =========================================================
# 请输入，你想让备份数据放置到那个独立的目录去
basedir=/home/client/bak
srcdir=/home/client/src/webapp

# ===========================================================
zipfile=$basedir/app.db.$(date +%Y-%m-%d).zip

[ ! -d "$basedir" ] && mkdir $basedir


cd $srcdir
  zip -r $zipfile ./*
