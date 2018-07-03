all:
	@echo "Specify a target."

docs:
	pdoc --html --overwrite --html-dir ./docs ./teampy

pypi: docs
	sudo python2 setup.py register sdist upload

dev-install: docs
	rm -rf ./dist
	python setup.py sdist
	pip install -U dist/*.tar.gz

deploy: docs
	rm -rf ./dist
	python setup.py sdist
	twine upload dist/*

pep8:
	pep8-python2 pdoc/__init__.py scripts/pdoc

push:
	git push origin master
	git push github master

runtests:
	python -m unittest tests/test_teampy.py
