FROM julia:1.5-buster

USER root

RUN set -eux; \
    apt-get update && \
    apt-get install --no-install-recommends -y nano/stable less/stable && \
    rm -rf /var/lib/apt/lists/*

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
    mamba install -y jupyterlab=3.0.10 bottle glances jupyter-server-proxy nodejs \
    && mamba clean --all -f -y

RUN jupyter labextension install @jupyterlab/server-proxy
COPY --chown=arthur:arthur jupyter_notebook_config.py /home/arthur/mambaforge/etc/jupyter

RUN julia -e "using Pkg; Pkg.add([\"IJulia\",\"Pluto\"]); Pkg.precompile();"

# These notebooks can be used to test that the image works
COPY --chown=arthur:arthur julia-test.ipynb .
RUN chmod a+w julia-test.ipynb
COPY --chown=arthur:arthur python-test.ipynb .
RUN chmod a+w python-test.ipynb

# Jupyter:
# Setting JUPYTER_TOKEN environment variable sets the token
EXPOSE 8888/tcp
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888"]
