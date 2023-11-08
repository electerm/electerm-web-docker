#!/bin/bash
git clone --depth 1 https://github.com/electerm/electerm-web.git
cd electerm-web
npm install
npm run build
cp .sample.env .env
