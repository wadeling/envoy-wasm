Proof of Concept WebAssembly Support.

# WebAssembly VM

The WebAssembly VM is https://github.com/WAVM/WAVM. This VM was chosen for the
proof of concept because:

  - It is OSS with a permissive licencse.
  - It compiles with LLVM for high performance.
  - It can attach pre-compiled code to the WASM files (e.g. during distribution
      from a central controller) for faster startup and reduced load on a pool
      of proxies.

Installation
  - sudo apt install llvm-6.0-dev
  - install clang++-7
  - install cmake (might need a recent version from cmake.org)
  - git clone WASM repository parallel to envoy repository (if it exists) or https://github.com/WAVM/WAVM.
  - cd WAVM; cmake -DWAVM_ENABLE_STATIC_LINKING=YES -DCMAKE_C_COMPILER=/usr/bin/clang-7 -DCMAKE_CXX_COMPILER=/usr/bin/clang++-7 .
  - sudo make install

# TODO

  - Check if the thread is running in the VM in the WAVM Runtime signal handlers and
    if not call the underlying signal handler from Envoy or add the WAVM signal handler
    as a pre-check to the Envoy signal handler with the same check.
  - Add support to WAVM for multple stacks for coroutines/streams with thread shared state.
    - evaluate async emscripten: https://github.com/kripken/emscripten/wiki/Asyncify
    - evaulate boost::fiber, GNU Pth, getcontext(), setcontext(), swapcontext().
  - Add support for shared global state.
  - Intercept logging messages from WAVM and send to Envoy logs.