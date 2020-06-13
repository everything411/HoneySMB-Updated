# HoneySMB
Simple High Interaction Honeypot Solution for SMB protocol. This repository resolves all installation problem faced in the installation of [HoneySMB](https://github.com/nishitm/HoneySMB).

The changes I have made are following
1. Dockerfile to resolve errors.
2. Create a better Readme file.

## Installation Steps
### Method 1
1. `docker build -t smb .`
2. `docker run -d --name smbhoneypot smb`

### Method 1
1. `./build.sh`
Give ip if you don’t it will automatically select ip

