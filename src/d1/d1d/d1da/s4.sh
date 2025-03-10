#!/bin/bash
# Send the output from 'set -x' to 'stdout' rather than 'stderr'.
BASH_XTRACEFD=1
set -eux

KGXW_ROOT_DIR="/home/xdsw/github/KGXW-mip-tools"
RESTRUCTURE_COMMAND="/bin/restructure_for_klh6"

ROOT_RESTRUCTURED_DIR="${BVCD_WORKFLOW_SHARE_DIR}/work/"

${KGXW_ROOT_DIR}${RESTRUCTURE_COMMAND} -d ${ROOT_RESTRUCTURED_DIR} ${ROOT_DATA_DIR}
