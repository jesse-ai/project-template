# Dockerfile for Jesse Trading Bot with Jupyter
FROM salehmir/jesse:latest

# Install Jupyter and other useful tools
RUN pip install --no-cache-dir \
    jupyter \
    notebook \
    jupyterlab \
    ipykernel \
    matplotlib \
    seaborn \
    plotly

# Set working directory
WORKDIR /home

# Copy startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose ports
EXPOSE 9000 8888

# Startup command
CMD ["/usr/local/bin/start.sh"]
