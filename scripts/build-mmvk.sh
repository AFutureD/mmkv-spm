#!/bin/zsh

set -e

echo "dir: $(pwd)"
echo "args: $@"
echo "ls: $(ls -la)"

echo "ls $(ls -ls ../)"