FROM julia:1.6-buster

USER root
RUN useradd -ms /bin/bash arthur

USER arthur
WORKDIR /home/arthur
ENV PATH="/home/arthur/mambaforge/bin:${PATH}"

RUN set -eux; \
    curl -LJO --output Mambaforge-Linux-x86_64.sh \
    https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh \
    && bash Mambaforge-Linux-x86_64.sh -b \
    && rm -f Mambaforge-Linux-x86_64.sh 

RUN set -eux; \
    mamba install -y jupyterlab \
    && mamba clean --all -f -y

RUN julia -e "using Pkg; Pkg.add(\"IJulia\"); Pkg.precompile();"

EXPOSE 8888/tcp
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888"]
