FROM linuxserver/sonarr:preview

RUN apt-get update && \
 apt-get install -y \
	python3 python3-requests nano mkvtoolnix ffmpeg && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*
