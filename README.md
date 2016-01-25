# rta-ttpub
Code for Dayton worked with the Dayton RTA to setup an open source application
https://code.google.com/p/timetablepublisher
for converting their time tables to PDF files for inclusion into their print
media.

## VM Setup
The Dayton RTA requested the software setup in the form of a VMWare image.
The resulting image was setup with:
- Ubuntu 14.04
- A user account named "rta" with sudo access
- OpenJDK 7
- Apache Tomcat 7
- ttpub app installed to /var/lib/tomcat7/webapps/ROOT
- Dayton GTFS data installed to /var/lib/tomcat7/webapps/ROOT/WEB-INF/classes/org/gtfs/schedule/dayton
- Application available at http://localhost:8080

## Docker Commands
The Code for Dayton team used Docker to setup the application on their laptops
and figure out how to run it. The steps outlined in the Dockerfile were similar
to what we did to setup the VM image.

To Build:
docker build -t rta .

To Run:
docker run -d -p 8080:8080 rta
