FROM artemisfowl004/vid-compress
RUN mkdir ./app
RUN chmod 777 /app
WORKDIR /app
RUN apt -qq update --fix-missing
RUN apt -qq install -y git \
    aria2 \
    python3 \
    python3-pip \
    wget \
    zstd \
    p7zip \
    ffmpeg \
    curl
COPY requirements.txt .
RUN pip3 install motor
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY .netrc /root/.netrc
RUN chmod 600 /app/.netrc
RUN chmod +x /app/aria.sh
CMD ["bash","start.sh"]
