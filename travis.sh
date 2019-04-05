#!/bin/bash
# on error exit
# install mscgen
cd /tmp
wget https://files.pythonhosted.org/packages/69/2b/1d78898c62a9b12d0949d28c1221d4e7e299b7d51859b149f6f4e7b3ed51/sphinxcontrib-mscgen-0.4.tar.gz
tar xzvf sphinxcontrib-mscgen-0.4.tar.gz
cd sphinxcontrib-mscgen-0.4
cat sphinxcontrib/mscgen.py | sed 's/OSError,/OSError as/' > sphinxcontrib/mscgen.py
sudo python3 setup.py install
set -e
# Flags used here, not in `make html`:
#  -n   Run in nit-picky mode. Currently, this generates warnings for all missing references.
#  -W   Turn warnings into errors. This means that the build stops at the first warning and sphinx-build exits with exit status 1.
#  -N   Do not emi colors
#  -T   output full traceback
# --keep-going continue the processing after a warning
sphinx-build  -nWNT --keep-going -b html . /tmp
