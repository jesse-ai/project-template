FROM salehmir/jesse:latest

WORKDIR /root

RUN pip3 uninstall -y jesse \
    && pip3 install -r https://raw.githubusercontent.com/jesse-ai/jesse/beta/requirements.txt \
    && mkdir /root/jesse-framework

WORKDIR /root/

RUN git clone https://github.com/jesse-ai/jesse.git jesse-framework

WORKDIR /root/jesse-framework

RUN git checkout beta \
    && pip3 install -e .

WORKDIR /home
