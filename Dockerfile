FROM java

WORKDIR /
COPY target/universal/assignment-1.0-SNAPSHOT.zip .

RUN unzip ./assignment-1.0-SNAPSHOT.zip

RUN rm -r ./assignment-1.0-SNAPSHOT.zip

ENTRYPOINT ./assignment-1.0-SNAPSHOT/bin/assignment
