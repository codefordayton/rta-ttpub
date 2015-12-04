FROM tomcat:8-jre8

RUN apt-get update

WORKDIR /data
COPY data /data

ENV CATALINA_OPTS "-server -Xms2048m -Xmx2048m -XX:PermSize=128m -XX:MaxPermSize=128m -XX:NewRatio=2 -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseParallelGC -XX:+UseParallelOldGC -XX:+AggressiveOpts -Duser.timezone=GMT -Djava.awt.headless=true"
ENV JAVA_HOME /usr/

COPY tomcat/ttpub.war $CATALINA_HOME/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
