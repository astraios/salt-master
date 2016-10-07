FROM centos

# Update the container
RUN yum update -y

# Install required distrib packages
RUN yum install -y wget vim

# Install SaltStack 
# -X does not start daemon after install
# -M install salt-master
# -N does not install salt-minion
RUN wget -O bootstrap_salt.sh https://bootstrap.saltstack.com
RUN sh bootstrap_salt.sh -X -M -N stable

# Instal salt-ssh
RUN yum install -y openssh-clients
RUN yum install -y salt-ssh

# Workdir
RUN mkdir /data
WORKDIR /data
COPY bootstrap.sh bootstrap.sh
RUN chmod 755 bootstrap.sh
RUN cp -a /etc/salt /data/etc-template

# Small cleanup
RUN yum clean all

# Volumes
VOLUME ["/data/config", "/var/log/salt", "/var/cache/salt"]

# Expose ports
EXPOSE 4505 4506

# Entrypoint
CMD ["/data/bootstrap.sh"]
