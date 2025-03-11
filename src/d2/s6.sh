#!/bin/bash -l
set -eu

module_count(){
    module list -t 2>&1 | wc -l
}

safe_load(){
    PRE_LOAD_COUNT=$(module_count)

    module load "${1}"
    # Check module count to determine whether module load was successful.
    if (( PRE_LOAD_COUNT == $(module_count) )); then
        echo "[ERROR] Failed to load module: ${1}"
        exit 1
    fi
}

# Must be run before importing numpy, see
# https://www-avd/sci/dask_best_practice/numpy-threads.html.
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1

# Ensure '~/.local' isn't added to 'sys.path'.
export PYTHONNOUSERSITE=True

safe_load "${GGH2TOOL_MODULE_NAME}"

# If PYTHONPATH_PREPEND has been set, prepend it to PYTHONPATH to extend the
# Python environment.
if [[ -n ${PYTHONPATH_PREPEND:-} ]]; then
    echo "[INFO] Prepending the following to PYTHONPATH: ${PYTHONPATH_PREPEND}"
    export PYTHONPATH=${PYTHONPATH_PREPEND}:${PYTHONPATH:-}
fi

if [[ -z ${QUIET_MODE:-} ]]; then
    echo "[OK] Modules loaded."
fi

command="/usr/bin/time -v -o ${CFCAL_TASK_LOG_ROOT}.time $*"
exec ${command}
