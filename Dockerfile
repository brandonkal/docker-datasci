FROM jupyter/scipy-notebook
EXPOSE 80

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
    
RUN jupyter labextension install @jupyterlab/plotly-extension && \
jupyter labextension install @jupyterlab/git && \
pip install jupyterlab-git && \
jupyter serverextension enable --py jupyterlab_git && \
npm cache clean --force

CMD ["start.sh", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--LabApp.token='datasci'"]
