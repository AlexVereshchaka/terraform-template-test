# terraform-template-test

This is a terraform template that creates a VPC in the eu-north-1 region with two /24 subnets, each of the subnets has an http and ftp server with zero downtime. Routing between networks is configured with the ability to access the http server from the Internet.