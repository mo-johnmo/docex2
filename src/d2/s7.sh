#!/bin/bash -l
set -eu

# Ensure '~/.local' isn't added to 'sys.path'.
export PYTHONNOUSERSITE=True

# If PYTHONPATH_PREPEND has been set, prepend it to PYTHONPATH to extend the
# Python environment.
if [[ -n ${PYTHONPATH_PREPEND:-} ]]; then
    echo "[INFO] Prepending the following to PYTHONPATH: ${PYTHONPATH_PREPEND}"
    export PYTHONPATH=${PYTHONPATH_PREPEND}:${PYTHONPATH:-}
fi

ROOT_SOFTWARE_DIR="src/d1"
GGfx_COMMAND="/../d2/s7.sh"
GGfx_VERSION="666.1.0"
# shellcheck source=src/d1/../d2/s7.sh
source "${ROOT_SOFTWARE_DIR}${GGfx_COMMAND}" "${GGfx_VERSION}"

if [[ -z ${QUIET_MODE:-} ]]; then
    echo "[OK] GGfx environment loaded."
fi

command="/usr/bin/time -v -o ${PROCA_TASK_LOG_ROOT}.time $*"
exec ${command}
