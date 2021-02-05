FROM julia:1.5-buster

USER root
RUN useradd -ms /bin/bash arthur

USER arthur
WORKDIR /home/arthur
ENV PATH="/home/arthur/miniconda3/bin:${PATH}"

RUN set -eux; \
    curl --output Miniconda3-latest-Linux-x86_64.sh \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /home/arthur/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN set -eux; \
    conda install -c conda-forge -y jupyterlab \
    && conda clean --all -f -y

RUN julia -e "using Pkg; Pkg.add(\"IJulia\"); Pkg.precompile();"

EXPOSE 8888/tcp
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888"]
