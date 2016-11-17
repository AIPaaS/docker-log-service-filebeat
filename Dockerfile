FROM centos:7

# Delete CentOS installation log
RUN rm -Rf /var/log/anaconda  
  
# Install Filebeat
# See https://www.elastic.co/downloads/beats/filebeat for current version
# https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-x86_64.rpm
RUN curl -LO https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-x86_64.rpm && \
  yum localinstall -y filebeat-5.0.0-x86_64.rpm && \
  rm -f filebeat-5.0.0-x86_64.rpm && \
  yum clean all && \
  rm -f /var/log/yum.log

# Copy configuration file  
COPY filebeat.yml /etc/filebeat/

# Copy entrypoint script
COPY fb_start.sh /
RUN chmod 777 fb_start.sh

#设置时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone

# Declare log directory as volumes, for use of --volumes-from
VOLUME ["/var/log"]

#ENTRYPOINT ["/fb_start.sh"]
CMD ["/fb_start.sh"]