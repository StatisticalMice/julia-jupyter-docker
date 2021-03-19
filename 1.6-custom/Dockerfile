FROM statisticalmice/julia-jupyter:1.6

USER arthur
WORKDIR /home/arthur

RUN julia -e "using Pkg; Pkg.add([\"DataFrames\",\"Plots\",\"PlutoUI\"]); Pkg.precompile();"

# Install PyCall and instruct it to use the python installed by conda

ENV PYTHON=/home/arthur/mambaforge/bin/python
RUN julia -e "using Pkg; Pkg.add([\"PyCall\"]); Pkg.build(\"PyCall\");"

RUN set -eux; \
    mamba install -y scipy seaborn matplotlib pandas \
    && mamba clean --all -f -y

CMD ["bash"]
