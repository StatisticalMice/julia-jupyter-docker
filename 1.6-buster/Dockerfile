FROM julia:1.6-buster

USER root
RUN apt-get update && \
    apt-get install --no-install-recommends -y wget/stable && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash arthur
USER arthur
WORKDIR /home/arthur
ENV PATH="/home/arthur/miniconda3/bin:${PATH}"
RUN wget -nv \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /home/arthur/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda install -c conda-forge -y jupyterlab
RUN julia -e "using Pkg; Pkg.add(\"IJulia\"); Pkg.precompile();"

EXPOSE 8888/tcp
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888"]
