FROM yangchuansheng/alpine
MAINTAINER yangchuansheng <yangchuansheng33@gmail.com>
WORKDIR /root
RUN PATH=/usr/local/Mojo_ActivePerl/site/bin:/usr/local/Mojo_ActivePerl/bin:$PATH \
    && export PATH
COPY qq1.pl qq1.pl
CMD ["/usr/local/Mojo_ActivePerl/bin/perl","qq1.pl"]
