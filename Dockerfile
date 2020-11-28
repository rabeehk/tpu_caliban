FROM gcr.io/tpu-pytorch/xla:nightly_3.7
RUN echo 'conda activate pytorch' >>  ~/.bashrc
#COPY test / 
COPY ./run_training.sh /
COPY ./change_runtime.py /
ENTRYPOINT ["bash", "/run_training.sh"]
