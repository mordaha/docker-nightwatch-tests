FROM node:8

# install nightwatch
RUN npm install -g nightwatch

# install google chrome + chromedriver
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN apt-get -yqq update && \
    apt-get -yqq install curl unzip && \
    apt-get -yqq install xvfb tinywm && \
    apt-get -yqq install fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic && \
    apt-get -yqq install google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    curl -sS -o /tmp/chromedriver_linux64-${CHROMEDRIVER_VERSION}.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64-${CHROMEDRIVER_VERSION}.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver

# for xvfb
ENV DISPLAY :20.0
ENV SCREEN_GEOMETRY "1280x800x24"

COPY entrypoint.sh /bin/entrypoint
COPY nightwatch.json /nightwatch.json

RUN mkdir -p /tests

WORKDIR /tests

VOLUME ["/tests"]

EXPOSE 4444

ENTRYPOINT ["/bin/entrypoint"]
