# Usage

Run interactively:

```bash
mkdir -p ./out ./.creds

docker build -t legate-separate-build-scripts .

# Run interactively:
docker run --rm -it -u coder \
    -v "$(pwd)/out:/tmp/out" \
    legate-separate-build-scripts \
    /bin/bash -i build-all
```

To run headlessly:

```bash
mkdir -p ./out ./.creds

docker build -t legate-separate-build-scripts .

# 1. Generate a personal access token at
#    https://github.com/settings/tokens/new
#    with scopes: repo, read:org, gist

# 2. Save the token to .creds/GH_TOKEN:
cat <<EOF > .creds/GH_TOKEN
<YOUR GITHUB PERSONAL ACCESS TOKEN HERE>
EOF

# 3. Mount the .creds directory into the container
docker run --rm -it -u coder \
    -v "$(pwd)/out:/tmp/out" \
    -v "$(pwd)/.creds:/run/secrets" \
    legate-separate-build-scripts \
    /bin/bash -i build-all
```
