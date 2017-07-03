#!/bin/sh

/usr/bin/Xvfb ${DISPLAY} -screen 0 ${SCREEN_GEOMETRY} -ac &

/usr/local/bin/chromedriver --port=9515 --url-base=/wd/hub &

while ! curl localhost:9515; do echo -n .; sleep 1; done

nightwatch -c /nightwatch.json
