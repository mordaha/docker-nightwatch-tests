# Nightwatch tests with Chrome

Useful on CI or at site monitoring.

## Run local

```sh
$ git clone
$ docker build -t your/tag-for-this-image .

$ docker run --rm -v /your/dir/with/tests:/tests your/tag-for-this-image
```

## Sample tests

Look at `./tests/test_example_google_com.js`

Run it `$ ./runtests.sh`

## Nightwatch API

API Docs: <http://nightwatchjs.org/api>


## License: MIT
