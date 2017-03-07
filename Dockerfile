FROM perl:5.22
MAINTAINER sjdy521 <sjdy521@163.com>
RUN apt update
RUN apt-get install localepurge
RUN dpkg-reconfigure localepurge
RUN locale-gen zh_CN.UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN cpanm Mojo::Webqq \
    && cpanm Mojo::SMTP::Client \
    && cpanm --mirror http://mirrors.163.com/cpan/ ZHOUYI::ZhanPu \
    && cpanm Term::ANSIColor \
    && mkdir /root/webqq
WORKDIR /root/webqq
COPY qq.pl qq.pl
CMD ["perl","qq.pl"]
