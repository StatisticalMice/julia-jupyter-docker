FROM statisticalmice/julia-jupyter:1.6

USER arthur
WORKDIR /home/arthur

# Rstudio server is not installed as it's not available from conda forge

# Install R and some packages
RUN conda install -y r-base r-tidyverse r-IRkernel r-data.table
RUN R -e 'IRkernel::installspec()'

CMD ["bash"]
