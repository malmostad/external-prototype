#!/usr/bin/env sh

# Run before pushing to Github

# During dev of sass and coffee, use watchers instead:
#    sass --watch stylesheets/application.scss
#    coffee -c -w javascripts/application.coffee

echo "Converting and compressing Coffee files"
cd javascripts
coffee -c application.coffee
uglifyjs application.js > _temp.js
rm application.js
mv _temp.js application.js

echo "Converting and compressing Sass files"
cd ../stylesheets
sass --style compressed application.scss:application.css
cd ..
