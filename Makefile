OBJECTS = css icons *.html* .ht* *.txt
PRODUCTION = hhsw.de@ssh.strato.de:sites/kartpokal/
PROTO = hhsw.de@ssh.strato.de:sites/proto/kartpokal/
OPTIONS = --exclude=src \
	--recursive \
	--links \
	--update \
	--delete-after \
	--times \
	--compress

production: compress
	cd htdocs && rsync $(OPTIONS) \
		$(OBJECTS) \
		$(PRODUCTION)

proto: compress
	cd htdocs && rsync $(OPTIONS) \
		$(OBJECTS) \
		$(PROTO)

compress:
	@srcar body.css \
		Season.css \
		Tracks.css \
		Footer.css
	@for F in htdocs/*.html; \
	do \
		gzip < $$F > $$F.gz; \
	done
