@echo off
set a=1.0.0.1
set /p a=������ IP��Ĭ�ϣ�%a%��
title  ���ڲ��� %a%
curl --resolve speed.cloudflare.com:443:%a% https://speed.cloudflare.com/__down?bytes=1000000000 -o nul --connect-timeout 5