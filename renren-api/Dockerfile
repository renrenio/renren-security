FROM java:8
EXPOSE 8081

VOLUME /tmp
ADD renren-api.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
