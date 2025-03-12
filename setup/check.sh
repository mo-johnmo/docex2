#!/bin/bash
# Shellcheck all scripts

find ~/myrepos/docex2/src -type f \( -name '*.sh' -or ! -name '*.*' \) ! \
-name "Makefile" ! -name "README" ! -path "*.git*" ! \
-path "*cache*" -exec shellcheck {} +

