FROM centos/ruby-23-centos7:latest
USER root
RUN yum -y install httpd && yum clean all
COPY s2i/bin/ $STI_SCRIPTS_PATH
USER 1001
COPY gitconfig $HOME/.gitconfig
RUN source /opt/app-root/etc/scl_enable && \
    gem install --no-rdoc --no-ri ascii_binder
CMD $STI_SCRIPTS_PATH/usage
