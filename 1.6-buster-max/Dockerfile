FROM statisticalmice/julia-jupyter:1.6-buster

USER root
WORKDIR /tmp

RUN set -eux; \
    curl -LJO --output rr-5.4.0-Linux-$(uname -m).deb \
    "https://github.com/rr-debugger/rr/releases/download/5.4.0/rr-5.4.0-Linux-$(uname -m).deb" \
    && dpkg -i rr-5.4.0-Linux-$(uname -m).deb

USER arthur
WORKDIR /home/arthur

CMD ["bash"]
