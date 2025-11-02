#!/bin/bash
set -e

echo "🚀 Installing Twenty..."
bash <(curl -sL https://raw.githubusercontent.com/twentyhq/twenty/main/packages/twenty-docker/scripts/install.sh)
echo "✅ Twenty installation completed!"
