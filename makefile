install:
	./install.sh

sync:
	./sync.sh

clean:
	find . -name \*.pyc -delete
	find . -name __pycache__ -delete
	find . -name ".mypy_cache" -exec rm -rf {} \;
	find . -name "flycheck_*" -exec rm -rf {} \;


tree: clean
	tree -I "venv|tmp|*.egg-info" .
