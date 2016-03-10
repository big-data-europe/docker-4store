FROM bde2020/4store

MAINTAINER Yiannis Mouchakis <gmouchakis@iit.demokritos.gr>

#Expose 4s-boss default port
EXPOSE 6733

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


