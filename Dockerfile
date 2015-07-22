FROM ruby:2.2

RUN apt-get update -y && \
  apt-get install -y \
  nodejs \
  sqlite3 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ["Gemfile","/usr/src/app/" ]
COPY ["Gemfile.lock","/usr/src/app/" ]
RUN bundle install

COPY . /usr/src/app
EXPOSE 3000
CMD ["rails", "server", "-b","0.0.0.0"]
