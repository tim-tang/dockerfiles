FROM oraclelinux:6.6
MAINTAINER Tim Tang <tim.tang@oracle.com>
#ADD database /installer

# fix locale error
RUN echo LANG=en_US.utf-8 >> /etc/environment \
 && echo LC_ALL=en_US.utf-8 >> /etc/environment

# add extra packages
RUN yum install -y vim-minimal
RUN yum install -y wget
#RUN cd /etc/yum.repos.d \
# && wget http://public-yum.oracle.com/public-yum-ol6.repo
RUN yum install -y oracle-rdbms-server-11gR2-preinstall

# create oracle installation directories
RUN mkdir -p /opt/app/oracle/product/11.2.0/db_1 \
 && chown -R oracle:oinstall /opt \
 &&  chmod -R 775 /opt

# set environment variables
RUN su - oracle
RUN echo "export TMP=/tmp;" >> /home/oracle/.bashrc \
 && echo "export TMPDIR=/tmp;" >>  /home/oracle/.bashrc \
 && echo "export ORACLE_HOSTNAME=orcl11g.cn.oracle.com;"  >> /home/oracle/.bashrc \
 && echo "export ORACLE_UNQNAME=orcl;" >> /home/oracle/.bashrc \
 && echo "export ORACLE_BASE=/opt/app/oracle;" >> /home/oracle/.bashrc \
 && echo "export ORACLE_HOME=/opt/app/oracle/product/11.2.0/db_1;" >> /home/oracle/.bashrc \
 && echo "export ORACLE_SID=orcl;" >> /home/oracle/.bashrc \
 && echo "export PATH=/opt/app/oracle/product/11.2.0/db_1/bin:$PATH;" >> /home/oracle/.bashrc \
 && echo "export LD_LIBRARY_PATH=/opt/app/oracle/product/11.2.0/db_1/lib:/lib:/usr/lib; " >> /home/oracle/.bashrc \
 && echo "export CLASSPATH=/opt/app/oracle/product/11.2.0/db_1/jlib:$/opt/app/oracle/product/11.2.0/db_1/rdbms/jlib;" >> /home/oracle/.bashrc 

# Install packages and set up sshd
RUN yum -y install openssh-server
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Add scripts
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
ADD dbora /etc/init.d/
RUN chmod +x /*.sh
RUN chmod 750 /etc/init.d/dbora
RUN chkconfig --add /etc/init.d/dbora 

# confirm
RUN cat /etc/oracle-release

EXPOSE 22
EXPOSE 1521
CMD ["/run.sh"]
