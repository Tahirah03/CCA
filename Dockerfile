FROM python:3.9-slim-buster

# Installer les dépendances
RUN apt-get update && apt-get install -y python3 python3-pip


# Ajout des librairies python
RUN pip3 install --upgrade pip
RUN pip3 install jupyter numpy pandas matplotlib seaborn scipy scikit-learn

# Ajout des données dans le conteneur
COPY "notebook.ipynb" /notebook/
COPY "Test_Clusters_Distincts.txt" /

# Expose Jupyter port
EXPOSE 8888

# Run Jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--notebook-dir=/notebook"]

