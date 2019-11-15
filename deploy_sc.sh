#!/bin/bash

set -eux -o pipefail

echo -e "#\n# Deploy Supercollider\n#"
./build-supercollider.sh

echo -e "#\n# Deploy sc3-plugins\n#"
./build-sc3-plugins.sh
