FROM perl:5.22
MAINTAINER sjdy521 <sjdy521@163.com>
RUN echo "haha"
RUN cpanm Mojo::Webqq \
    && cpanm Mojo::SMTP::Client \
    && cpanm --mirror http://mirrors.163.com/cpan/ ZHOUYI::ZhanPu \
    && cpanm Term::ANSIColor \
    && mkdir /root/webqq
WORKDIR /root/webqq
COPY qq.pl qq.pl
CMD ["perl","qq.pl"]
