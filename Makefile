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
	./node_modules/.bin/browserify\
		--require=react\
		--outfile=public/js/libs.min.js

buildclient:
	./node_modules/.bin/browserify\
		--exclude=react\
		--transform=babelify\
		--outfile=public/js/client.min.js src/client/index.js

clean:
	rm --force --recursive public/js/*
	rmdir public/js

run: build
	google-chrome --incognito public/index.html
