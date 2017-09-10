#!/bin/bash

zip paketti.zip index.html dist/* ./node_modules/onsenui/css/onsenui.css ./node_modules/onsenui/css/onsen-css-components.css
scp paketti.zip xn--hyty-6qa.net:/mnt/virsi1
