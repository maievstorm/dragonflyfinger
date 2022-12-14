 
FROM frolvlad/alpine-miniconda3:latest
#FROM registry.apps.xplat.fis.com.vn/continuumio/miniconda3

# 
WORKDIR /code

# 
#RUN apt-get install -y gcc libav-tools
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
RUN chmod -R 777 /code
#RUN /code/hash.sh
USER 1001
# 
CMD ["uvicorn", "service:app", "--host", "0.0.0.0", "--port", "8080"]
