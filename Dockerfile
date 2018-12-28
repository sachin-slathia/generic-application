FROM java

COPY target/universal/assignment-1.0-SNAPSHOT.zip /

RUN unzip target/universal/assignment-1.0-SNAPSHOT.zip

RUN rm -r target/universal/assignment-1.0-SNAPSHOT.zip

CMD ./assignment-1.0-SNAPSHOT/bin/assignment &
