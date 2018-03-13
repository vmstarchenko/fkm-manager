sync:
	.scripts/sync.sh

install_src:
	cp -r src/* ~/.emacs.d/

install_packages:
	.scripts/install_packages.py

install: install_src install_packages
	true

clean:
	find . -name \*.pyc -delete
	find . -name __pycache__ -delete
	find . -name ".mypy_cache" -exec rm -rf {} \;
	find . -name "flycheck_*" -exec rm -rf {} \;


tree: clean
	tree -I "venv|tmp|*.egg-info" .
