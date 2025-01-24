# Xray REALITY 服务器端快速部署方案

#### 本方案旨在帮助用户快速部署基于 Xray-core 的 REALITY 协议服务器，以实现更安全、更高效的网络代理。目前仅支持 Ubuntu 和 Debian 操作系统。

## 特点

*   **快速部署：** 使用一键脚本简化安装和配置过程。
*   **增强安全性：** 基于 XTLS 的 REALITY 协议，提供更强的抗探测和抗干扰能力。
*   **高性能：** Xray-core 优化的网络堆栈带来卓越的性能表现。
*   **灵活的目标域名选择：** 支持自定义目标域名，以及提供常用域名列表供参考。
*   **默认禁用回国流量：** 提高安全性，避免流量特征被识别（可选择开启）。

## 准备工作

*   一台拥有公网 IP 的 Linux VPS (Ubuntu 或 Debian)
*   以 root 用户或具有 sudo 权限的用户身份登录 VPS

## 部署步骤

### 1. 关闭防火墙以及安装必要的软件

此步骤将关闭 `ufw` 或 `iptables` 防火墙，并安装 `curl`、`jq` 等后续步骤所需的工具。

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/prepare.sh)"
```

### 2. 安装 Xray

使用 XTLS 官方的安装脚本安装 Xray-core。

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/XTLS/Xray-install/refs/heads/main/install-release.sh)" @ install
```

### 3. 一键脚本生成配置文件

此步骤将生成 Xray 的 config.json 配置文件，其中包含 REALITY 协议的配置。

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/install.sh)"
```

### 4. 自定义目标域名

此步骤允许您自定义 REALITY 协议的目标域名。将 "www.airbnb.com" 替换为您想要使用的域名。

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/target.sh)" x www.airbnb.com
```

### 可以供选择的通用域名

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

## 关于回国流量

#### 本方案生成的配置文件默认禁用回国流量，以提高安全性。这意味着在使用全局代理时，您将无法访问国内网站。如果需要打开回国流量，请执行以下命令：

#### 重要提示： 打开回国流量会增加流量特征被识别的风险，请根据自身需求权衡。

```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/geoipcn.sh)"
```
