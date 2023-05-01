#! /usr/bin/env bash

echo "cwd: $(pwd)";
echo "user: $(whoami) ($(id -u):$(id -g))";
echo "PATH: $PATH";

exec ~/.local/bin/entrypoint build-all;
