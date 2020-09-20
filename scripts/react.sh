#!/usr/bin/env sh

rm -rv package.json package-lock.json .prettierrc.json .stylelintrc.json node_modules

npm init
npm i -D react
npm i -D react-dom
npm i -D prettier
npm i -D react-scripts
npm i -D browserlist
npm i -D node-sass

cp -f ~/dotfiles/react-package.json package.json
cp -f ~/dotfiles/.prettierrc.json .prettierrc
cp -f ~/dotfiles/.stylelintrc.json .stylelintrc.json
