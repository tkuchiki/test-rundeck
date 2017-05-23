FROM centos:centos7

RUN yum update -y && yum install -y openssh-clients openssh-server && ssh-keygen -A
RUN sed -ri '/^#PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config
RUN sed -ri 's/^#AuthorizedKeysFile/AuthorizedKeysFile/' /etc/ssh/sshd_config
RUN useradd -ms /bin/bash -d /home/rundeck rundeck

COPY .ssh /home/rundeck/.ssh
RUN chmod 700 /home/rundeck /home/rundeck/.ssh
RUN chown -R rundeck: /home/rundeck

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
