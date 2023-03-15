#!/bin/bash
sudo yum update
sudo yum install vsftpd
sudo systemctl enable --now vsftpd
sudo systemctl status vsftpd
