FROM julia:1.6-buster

USER root
RUN useradd -ms /bin/bash arthur
RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

USER arthur
WORKDIR /home/arthur
ENV PATH="/home/arthur/miniconda3/bin:${PATH}"
ARG PATH="/home/arthur/miniconda3/bin:${PATH}"
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /home/arthur/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda install -y jupyterlab

CMD ["julia"]
