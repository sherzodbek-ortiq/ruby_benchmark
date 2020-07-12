FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /ruby_benchmark
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install --without development test

COPY . $APP_HOME

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "config.ru", "--host", "0.0.0.0", "-p", "3000"]