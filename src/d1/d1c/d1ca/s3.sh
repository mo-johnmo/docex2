#!/bin/bash
# Send the output from 'set -x' to 'stdout' rather than 'stderr'.
BASH_XTRACEFD=1
set -eux

# Paths for site-specific environment scripts.
SOURCE_PROCESS_PATH="${WORKFLOW_RUN_DIR}/site/${SITE}-process-env"
SOURCE_STANDARDISE_PATH="${WORKFLOW_RUN_DIR}/site/${SITE}-standardise-env"
# Names of the environment scripts.
ENV_PROCESS_FILE="process-env"
ENV_STANDARDISE_FILE="standardise-env"
# Copy the environment scripts to the 'bin' directory.
cp "${SOURCE_PROCESS_PATH}" "${ENV_SCRIPTS_TARGET_DIR}/${ENV_PROCESS_FILE}"
cp "${SOURCE_STANDARDISE_PATH}" "${ENV_SCRIPTS_TARGET_DIR}/${ENV_STANDARDISE_FILE}"
