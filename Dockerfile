 
FROM registry.apps.xplat.fis.com.vn/continuumio/miniconda3:latest

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

#
RUN conda install -c conda-forge pydub
RUN conda install -c conda-forge PyAudio
RUN conda install -c conda-forge psycopg2
RUN conda install -c conda-forge ffmpeg

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./app /code

#
USER root
RUN chmod 777 /code/hash.sh
RUN /code/hash.sh
USER 1001
