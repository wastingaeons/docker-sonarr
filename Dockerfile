FROM hotio/sonarr:nightly as base
ENV PATH="/venv/bin:$PATH"
COPY . /
RUN apt-get update && \
 apt-get install -y \
        python3 python3-pip gcc python3-dev musl-dev python3-requests && \
pip3 install --upgrade setuptools && pip3 install virtualenv && pip3 install -r /requirements.txt && python3 -m venv /venv --without-pip && \
apt-get clean && \
 rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

FROM hotio/sonarr:nightly as img
ENV PATH="/venv/bin:$PATH"
RUN apt-get update && apt-get install -y mediainfo nano ffmpeg && apt-get clean && \       
 rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*
COPY --from=base /venv /venv
COPY --from=base /usr/local/lib/python3.8/dist-packages /venv/local/lib/python3.8/dist-packages
COPY --from=base /usr/lib/python3/dist-packages /venv/lib/python3/dist-packages
