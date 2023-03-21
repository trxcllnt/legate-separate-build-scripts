# Usage

```bash
mkdir -p ./out

docker build -t legate-separate-build-scripts .

# To skip the GitHub CLI login prompt, run with:
#   `-e GH_TOKEN=<GitHub personal access token>`
# where GH_TOKEN has "read:org" and "user:email" scopes

docker run --rm -it -u coder \
    -v "$(pwd)/out:/tmp/out" \
    legate-separate-build-scripts \
    /bin/bash -i build-all
```
