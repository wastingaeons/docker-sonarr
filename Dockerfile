FROM hotio/sonarr:nightly

RUN apt-get update && \
 apt-get install -y \
	python3 python3-requests mediainfo nano mkvtoolnix ffmpeg && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
