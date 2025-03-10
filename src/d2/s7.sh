#!/bin/bash -l
set -eu

# Ensure '~/.local' isn't added to 'sys.path'.
export PYTHONNOUSERSITE=True

# If PYTHONPATH_PREPEND has been set, prepend it to PYTHONPATH to extend the
# Python environment.
if [[ ! -z ${PYTHONPATH_PREPEND:-} ]]; then
    echo "[INFO] Prepending the following to PYTHONPATH: ${PYTHONPATH_PREPEND}"
    export PYTHONPATH=${PYTHONPATH_PREPEND}:${PYTHONPATH:-}
fi

ROOT_SOFTWARE_DIR="/home/GGfx/software"
GGfx_COMMAND="/../bin/setup_env_for_GGfx"
source "${ROOT_SOFTWARE_DIR}${GGfx_COMMAND}" ${GGfx_VERSION}

if [[ -z ${QUIET_MODE:-} ]]; then
    echo "[OK] GGfx environment loaded."
fi

command="/usr/bin/time -v -o ${PROCA_TASK_LOG_ROOT}.time $@"
exec ${command}
