FROM centos/ruby-23-centos7:latest
USER root
COPY s2i/bin/ $STI_SCRIPTS_PATH
COPY index.html /opt/app-root/contrib/index.html
USER 1001
COPY gitconfig $HOME/.gitconfig
RUN source /opt/app-root/etc/scl_enable && \
    gem install --no-rdoc --no-ri ascii_binder asdf
CMD $STI_SCRIPTS_PATH/usage
