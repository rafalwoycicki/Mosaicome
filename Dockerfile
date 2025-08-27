# ubuntu base image [pre-built debian-base python env]
FROM ubuntu:22.04

# reduce package overhead
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
	CONDA_DIR=/opt/conda \
    PIP_NO_CACHE_DIR=1

# install dependencies
RUN apt-get update &&  apt-get install -y --no-install-recommends build-essential \
	python3 \
	python3-dev \
	python3-pip \
	curl \
	sudo \
	git \
 	minimap2 \
	gfortran \
 	bzip2 \
  	ca-certificates \
	zlib1g-dev && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# user (for better security, don't run as root)
RUN useradd -m -s /bin/bash pymonk && \
    echo "pymonk:password" | chpasswd && \
    usermod -aG sudo pymonk
USER pymonk

# workspace
RUN mkdir -p ~/analysis && \
chown -R pymonk ~/analysis

WORKDIR ~/analysis

# (always specify exact version for python packages)
# COPY requirements.txt ./

# Download and install Miniforge
RUN wget --quiet https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O /tmp/miniforge.sh \
    && bash /tmp/miniforge.sh -b -p $CONDA_DIR \
    && rm /tmp/miniforge.sh \
    && $CONDA_DIR/bin/conda clean --all --yes

# Initialize conda for bash (so activation works)
RUN echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> /etc/bash.bashrc

# python pkgs
#RUN python3 -m venv 0env && source 0env/bin/activate && \
RUN python3 -m pip install --upgrade pip setuptools wheel && python3 -m pip install --no-cache-dir numpy pandas matplotlib 

SHELL ["/bin/bash", "--login", "-c"]
# python shell
CMD ["/bin/bash"]
