ARG CUDA=11.8
# FROM rapidsai/devcontainers:23.06-cpp-mambaforge-ubuntu22.04
FROM pauletaylor/devcontainers:23.06-cpp-cuda${CUDA}-mambaforge-ubuntu22.04
# FROM rapidsai/devcontainers:23.06-cpp-llvm15-rust-cuda${CUDA}-mambaforge-ubuntu22.04
# FROM rapidsai/devcontainers:23.06-cpp-llvm16-rust-cuda${CUDA}-mambaforge-ubuntu22.04

RUN export DEBIAN_FRONTEND=noninteractive       \
 && sudo apt update                             \
 && sudo apt install -y --no-install-recommends \
    numactl rlwrap

ENV PYTHONDONTWRITEBYTECODE=1
ENV SCCACHE_REGION="us-east-2"
ENV SCCACHE_BUCKET="rapids-sccache-devs"
ENV SCCACHE_S3_KEY_PREFIX=legate-cunumeric-dev
ENV VAULT_HOST=https://vault.ops.k8s.rapids.ai
ENV HISTFILE=/home/coder/.cache/._bash_history

ENV BOUNDS_CHECKS=OFF
ENV BUILD_MARCH=haswell
ENV GASNet_CONFIGURE_ARGS=--with-ibv-max-hcas=8
ENV MAX_DIM=4
ENV MAX_FIELDS=256
ENV USE_CUDA=ON
ENV USE_HDF5=OFF
ENV USE_LLVM=OFF
ENV USE_OPENMP=ON
ENV USE_SPY=OFF

USER coder

WORKDIR /home/coder/.cache
WORKDIR /home/coder

COPY --chown=coder:coder home/coder/.gitconfig /home/coder/
COPY --chown=coder:coder home/coder/.local/bin/* /home/coder/.local/bin/

ENTRYPOINT ["/home/coder/.local/bin/entrypoint"]
