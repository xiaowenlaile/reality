# Xray REALITY 服务器端快速部署方案 

## 1. 关闭防火墙以及安装必要的软件
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/prepare.sh)"
```

## 2. 安装 Xray
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/XTLS/Xray-install/refs/heads/main/install-release.sh)" @ install
```

## 3. 一键脚本生成配置文件
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/install.sh)"
```

## 4. 自定义目标域名
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/target.sh)" x "替换为目标域名"
```

## 通用域名
```
www.airbnb.com
download-installer.cdn.mozilla.net
addons.mozilla.org
www.lovelive-anime.jp
www.tesla.com
www.nvidia.com
www.sap.com

Apple:
gateway.icloud.com
itunes.apple.com
swdist.apple.com
swcdn.apple.com
updates.cdn-apple.com
mensura.cdn-apple.com
osxapps.itunes.apple.com
aod.itunes.apple.com

Microsoft:
www.microsoft.com
cdn-dynmedia-1.microsoft.com
update.microsoft
software.download.prss.microsoft.com

Amazon:
s0.awsstatic.com
d1.awsstatic.com
images-na.ssl-images-amazon.com
m.media-amazon.com
player.live-video.net
```
