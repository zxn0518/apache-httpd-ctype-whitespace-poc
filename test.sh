#!/bin/bash

echo "[*] 测试带空格等号的 Content-Type 参数"
curl -v -H "Content-Type: text/html; charset = utf-8" http://localhost:8080/

echo -e "\n[*] 测试正确格式的 Content-Type 参数"
curl -v -H "Content-Type: text/html; charset=utf-8" http://localhost:8080/
