# Variables
VENV_NAME?=venv
VENV_ACTIVATE=$(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python3

# Targets

all: venv

venv: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: requirements.txt
	test -d $(VENV_NAME) || virtualenv -p python3 $(VENV_NAME)
	${PYTHON} -m pip install -U pip
	${PYTHON} -m pip install -r requirements.txt
	touch $(VENV_NAME)/bin/activate

run: venv
	. $(VENV_ACTIVATE); flask run

test: venv
	. $(VENV_ACTIVATE); pytest

clean:
	rm -rf $(VENV_NAME)

.PHONY: all venv run test clean
