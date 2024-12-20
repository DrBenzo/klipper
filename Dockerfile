FROM ubuntu:22.04

# Установка необходимых зависимостей
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    virtualenv \
    sudo \
    curl \
    wget \
    software-properties-common \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Установка Moonraker и Klipper
RUN git clone https://github.com/Klipper3d/klipper /opt/klipper
RUN git clone https://github.com/Arksine/moonraker /opt/moonraker
RUN git clone https://github.com/mainsail-crew/mainsail /opt/mainsail

# Настройка виртуального окружения для Klipper
RUN virtualenv -p python3 /opt/klippy-env
RUN /opt/klippy-env/bin/pip install -r /opt/klipper/scripts/klippy-requirements.txt

# Настройка виртуального окружения для Moonraker
RUN virtualenv -p python3 /opt/moonraker-env
RUN /opt/moonraker-env/bin/pip install -r /opt/moonraker/scripts/moonraker-requirements.txt

COPY scripts/start.sh /start.sh
RUN chmod +x /start.sh

COPY config/nginx.conf /etc/nginx/nginx.conf

CMD ["/start.sh"] 