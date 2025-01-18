# Xray REALITY 服务器端快速部署方案 

## 1. 更新系统安装源 
```
sudo DEBIAN_FRONTEND=noninteractive apt -y update
```

## 2. 安装必要的软件
```
sudo DEBIAN_FRONTEND=noninteractive apt -y install curl unzip jq
```

## 3. 安装 Xray
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/XTLS/Xray-install/refs/heads/main/install-release.sh)" @ install
```

## 4. 一键脚本生成配置文件
```
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/install.sh)"
```

## 5. 确认开启 Xray 服务
```
sudo systemctl enable xray.service
```
