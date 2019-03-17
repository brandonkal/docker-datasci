FROM jupyter/scipy-notebook
EXPOSE 80

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

CMD ["start.sh", "jupyter lab", "--ip=0.0.0.0", "--port=80", "--LabApp.token='datasci'"]
