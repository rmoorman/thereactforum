browserify=./node_modules/.bin/browserify
uglifyjs=./node_modules/.bin/uglifyjs

install: installnpm

installnpm:
	npm install

test: testclient testserver

testserver:
	# test server

testclient:
	# test client

build: clean install test buildstructure buildlibs buildclient

buildstructure:
	mkdir public/js

buildlibs:
	$(browserify) --require=react --outfile=public/js/libs.min.js

buildclient:
	$(browserify)\
		--exclude=react\
		--transform=babelify\
		--outfile=public/js/client.min.js\
		src/client/index.js

buildproduction: build
	$(uglifyjs)\
		--compress\
		--output=public/js/libs.min.js\
		-- public/js/libs.min.js
	$(uglifyjs)\
		--compress\
		--output=public/js/client.min.js\
		-- public/js/client.min.js

clean:
	rm --force --recursive public/js/*
	rmdir public/js

run: build
	google-chrome --incognito public/index.html
