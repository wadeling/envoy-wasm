#!/bin/bash
./ci/run_envoy_docker.sh "BAZEL_BUILD_EXTRA_OPTIONS='--define wasm=enabled' ./ci/do_ci.sh bazel.release.server_only"
