FROM tomcat:latest

RUN apt-get update

ENV CATALINA_OPTS "-server -Xms2048m -Xmx2048m -XX:PermSize=128m -XX:MaxPermSize=128m -XX:NewRatio=2 -XX:SoftRefLRUPolicyMSPerMB=36000 -XX:+UseParallelGC -XX:+UseParallelOldGC -XX:+AggressiveOpts -Duser.timezone=GMT -Djava.awt.headless=true"
ENV JAVA_HOME /usr/

# Copy ttpub webapp into webapps folder
RUN cd $CATALINA_HOME/webapps/ROOT && rm -rf *
COPY tomcat/ttpub.zip $CATALINA_HOME/webapps/ROOT
RUN cd $CATALINA_HOME/webapps/ROOT && unzip ttpub.zip

# Copy GTFS data into schedule folder
COPY data/rtagtfs $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/org/gtfs/schedule/dayton


EXPOSE 8080

CMD ["catalina.sh", "run"]
