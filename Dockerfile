FROM perl:5.22
MAINTAINER sjdy521 <sjdy521@163.com>
RUN cpanm Mojo::Webqq \
    && cpanm Mojo::SMTP::Client
cpanm --mirror http://mirrors.163.com/cpan/ ZHOUYI::ZhanPu
WORKDIR /root
COPY qq.pl qq.pl
CMD ["perl","qq.pl"]
