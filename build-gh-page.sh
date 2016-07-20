#!/bin/bash
set -e

rm -rf build
elm make examples/Example.elm --output build/index.html

echo "Build successfully 🍣"

git checkout gh-pages
mv build/index.html index.html
git add index.html
git commit -m "Update gh-pages"
git push origin gh-pages

echo "Publish gh-pages successfully 🍣"

git checkout master
