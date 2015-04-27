install: installnpm

installnpm:
	npm install

test: testclient testserver

testserver:
	# test server

testclient:
	# test client

build: clean install test buildlibs buildclient

buildlibs:
	mkdir public/js
	./node_modules/.bin/browserify --require=react --outfile=public/js/libs.min.js

buildclient:
	./node_modules/.bin/babel --out-file=public/js/client.min.js src/client/index.js

clean:
	rm --force --recursive public/js/*
	rmdir public/js

run: build
	google-chrome --incognito public/index.html
