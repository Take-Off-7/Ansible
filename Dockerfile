# To create the Ubuntu image for Ansible target nodes 

FROM ubuntu
MAINTAINER takeoff <tfakeye7@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y openssh-server
RUN ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys && chmod 700 /root/.ssh
RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config || true
RUN sed -i 's/.*PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config || true
EXPOSE 22
CMD ["sh", "-c", "service ssh start && tail -f /dev/null"]
