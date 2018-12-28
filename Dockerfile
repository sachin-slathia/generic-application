FROM java

COPY archive/target/scala-2.11/assignment_2.11-1.0-SNAPSHOT-sans-externalized.jar /

RUN unzip assignment_2.11-1.0-SNAPSHOT-sans-externalized.jar 

RUN rm -r assignment_2.11-1.0-SNAPSHOT-sans-externalized.jar

CMD ./assignment-1.0-SNAPSHOT/bin/assignment &
