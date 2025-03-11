#!/bin/bash
# Shellcheck all scripts

find . -type f \( -name '*.sh' -or ! -name '*.*' \) ! \
-name "Makefile" ! -name "README" ! -path "*.git*" ! \
-path "*cache*" -exec shellcheck {} +

