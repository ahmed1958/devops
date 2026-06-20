#!/bin/sh

while ! timeout 1 bash -c "echo > /dev/tcp/vote/80"; do
    sleep 100
done

curl -sS -X POST --data "vote=b" http://vote > /dev/null
sleep 100
if phantomjs render.js http://result:4000 | grep -q '1 vote'; then
  echo -e "\\e[42m------------"
  echo -e "\\e[92mTests passed"
  echo -e "\\e[42m------------"
  exit 0
else
  echo -e "\\e[41m------------"
  echo -e "\\e[91mTests failed"
  echo -e "\\e[41m------------"
  exit 1
fi
