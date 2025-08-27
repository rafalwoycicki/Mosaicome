# Python base image [pre-built debian-base python env]
FROM python:3.12-slim

# reduce package overhead
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# install dependencies
RUN apt-get update &&  apt-get install -y --no-install-recommends build-essential \
	python3 \
	python3-dev \
	python3-pip \
	curl \
	sudo \
	git \
	gfortran \
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
COPY requirements.txt ./

# python pkgs
#RUN python3 -m venv 0env && source 0env/bin/activate && \
RUN python3 -m pip install --upgrade pip setuptools wheel && python3 -m pip install --no-cache-dir -r requirements.txt

# For R integration, install `r-base` and pip install rpy2 

# python shell
CMD ["python3"]
# (or, if you want to use jupyter notebook)

# jupyter notebook
#EXPOSE 8888
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
