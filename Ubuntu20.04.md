Ubuntu 20.04 

简体中文输入法安装:

sudo apt-get install ibus-rime

sudo apt install librime-data-pinyin-simp

https://github.com/rime/home/wiki/RimeWithIBus


CH34X:

https://learn.sparkfun.com/tutorials/how-to-install-ch340-drivers/linux

Sys_date:
sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
