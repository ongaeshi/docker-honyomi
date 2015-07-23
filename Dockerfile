FROM ruby:2.2.2

# Groonga(http://groonga.org/docs/install/debian.html)
RUN echo "deb http://packages.groonga.org/debian/ jessie main" >> /etc/apt/sources.list.d/groonga.list \
  && echo "deb-src http://packages.groonga.org/debian/ jessie main" >> /etc/apt/sources.list.d/groonga.list \
  && apt-get update \
  && apt-get install -y --allow-unauthenticated groonga-keyring \
  && apt-get update \
  && apt-get install -y libgroonga-dev

# Poppler
RUN apt-get install -y poppler-utils fonts-ipaexfont-gothic

# Honyomi
RUN gem install honyomi -v 1.3 --no-ri --no-rdoc
RUN honyomi init

EXPOSE 9295

CMD honyomi web --host=0.0.0.0 --no-browser
