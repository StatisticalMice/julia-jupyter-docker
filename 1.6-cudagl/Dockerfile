# Modified FROM
FROM nvidia/cudagl:11.2.2-devel 

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
# ERROR: no download agent available; install curl, wget, or fetch
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

ENV JULIA_PATH /usr/local/julia
ENV PATH $JULIA_PATH/bin:$PATH

# https://julialang.org/juliareleases.asc
# Julia (Binary signing key) <buildbot@julialang.org>
ENV JULIA_GPG 3673DF529D9049477F76B37566E3C7DC03D6E495

# https://julialang.org/downloads/
ENV JULIA_VERSION 1.6.0-rc3

RUN set -eux; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	if ! command -v gpg > /dev/null; then \
		apt-get update; \
		apt-get install -y --no-install-recommends \
			gnupg \
			dirmngr \
		; \
		rm -rf /var/lib/apt/lists/*; \
	fi; \
	\
# https://julialang.org/downloads/#julia-command-line-version
# https://julialang-s3.julialang.org/bin/checksums/julia-1.6.0-rc3.sha256
# this "case" statement is generated via "update.sh"
	dpkgArch="$(dpkg --print-architecture)"; \
	case "${dpkgArch##*-}" in \
# amd64
		amd64) tarArch='x86_64'; dirArch='x64'; sha256='d2e93e07d29fdc16c1efdebf16363c7f6afcae59b0b6b160d336ee93f9055d73' ;; \
# arm64v8
		arm64) tarArch='aarch64'; dirArch='aarch64'; sha256='4eb6b5df3aa1630a97b321bb6f000b00f4b7cc2f983ac9ecb2ac557b06b79991' ;; \
# i386
		i386) tarArch='i686'; dirArch='x86'; sha256='105e373dbfc7408e06f923c265deb9414c0e6fd3f517c284ed8931a371e1e8f7' ;; \
# ppc64le
		ppc64el) tarArch='ppc64le'; dirArch='ppc64le'; sha256='d6ee05ed2c1a3f1979eab6166b79d9680c145602bdd9d695378e0f71ef138b14' ;; \
		*) echo >&2 "error: current architecture ($dpkgArch) does not have a corresponding Julia binary release"; exit 1 ;; \
	esac; \
	\
	folder="$(echo "$JULIA_VERSION" | cut -d. -f1-2)"; \
	curl -fL -o julia.tar.gz.asc "https://julialang-s3.julialang.org/bin/linux/${dirArch}/${folder}/julia-${JULIA_VERSION}-linux-${tarArch}.tar.gz.asc"; \
	curl -fL -o julia.tar.gz     "https://julialang-s3.julialang.org/bin/linux/${dirArch}/${folder}/julia-${JULIA_VERSION}-linux-${tarArch}.tar.gz"; \
	\
	echo "${sha256} *julia.tar.gz" | sha256sum -c -; \
	\
	export GNUPGHOME="$(mktemp -d)"; \
#Modified hkp://ha.pool.sks-keyservers.net:80
	gpg --batch --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys "$JULIA_GPG"; \
	gpg --batch --verify julia.tar.gz.asc julia.tar.gz; \
	command -v gpgconf > /dev/null && gpgconf --kill all; \
	rm -rf "$GNUPGHOME" julia.tar.gz.asc; \
	\
	mkdir "$JULIA_PATH"; \
	tar -xzf julia.tar.gz -C "$JULIA_PATH" --strip-components 1; \
	rm julia.tar.gz; \
	\
		apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	\
# smoke test
	julia --version

# Above is from https://github.com/docker-library/julia/tree/bd481047baf707bfac6b6c918654256c4a6b4608/1.6-rc
# Below is from ../1.6-buster/Dockerfile

RUN set -eux; \
    apt-get update && \
	# Modified so that I took '/stable' out
    apt-get install --no-install-recommends -y nano less && \
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

ENV PYTHON=/home/arthur/mambaforge/bin/python
RUN julia -e "using Pkg; Pkg.add([\"IJulia\",\"Pluto\",\"PyCall\"]); Pkg.build(\"PyCall\"); Pkg.precompile();"

# These notebooks can be used to test that the image works
COPY --chown=arthur:arthur julia-test.ipynb .
RUN chmod a+w julia-test.ipynb
COPY --chown=arthur:arthur python-test.ipynb .
RUN chmod a+w python-test.ipynb

# Jupyter:
# Setting JUPYTER_TOKEN environment variable sets the token
EXPOSE 8888/tcp
CMD ["jupyter", "lab", "--ip", "0.0.0.0", "--port", "8888"]
