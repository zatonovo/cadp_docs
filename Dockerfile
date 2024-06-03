FROM charnelclamosa/zeomancer_ds_base
MAINTAINER AUTHOR

USER root

# Add in requirements from opencpu/base
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y lmodern

COPY . /app/zeomancer

WORKDIR /app/zeomancer

CMD [ "/app/zeomancer/make_book.sh" ]
