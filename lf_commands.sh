#!/usr/bin/env bash

# gfortran -c examples/expr2.f90 examples/dgemv.f examples/lsame.f examples/xerbla.f -o tmp

lfortran -c examples/expr2.f90 -o main.o --implicit-interface --generate-object-code
lfortran -c examples/dgemv.f -o dgemv.o --implicit-interface --fixed-form --generate-object-code
lfortran -c examples/lsame.f -o lsame.o --implicit-interface --fixed-form --generate-object-code
lfortran -c examples/xerbla.f -o xerbla.o --implicit-interface --fixed-form --generate-object-code



(lf) ubaid@ubaids-MacBook-Pro lf_mnist % lfortran -c src/expr2.f90 --implicit-interface --target=wasm32-wasi --skip-pass unused_functions
warning: Argument `access` isn't supported yet
  --> src/expr2.f90:26:5
   |
26 |     open(12, file="mnist.data", form="unformatted", access="stream", status="old")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ignored for now


Note: Please report unclear, confusing or incorrect messages as bugs at
https://github.com/lfortran/lfortran/issues.
(lf) ubaid@ubaids-MacBook-Pro lf_mnist % lfortran -c src/lapack.f --target=wasm32-wasi --fixed-form --skip-pa
ss unused_functions
(lf) ubaid@ubaids-MacBook-Pro lf_mnist % /Users/ubaid/ext/wasi-sdk-19.0/bin/clang --target=wasm32-wasi -nostartfiles -Wl,--entry=_start -Wl,-lwasi-emulated-process-clocks -o my_wasm_app expr2.o lapack.o.tmp.o /Users/ubaid/Desktop/OpenSource/lfortran/src/bin/../runtime/lfortran_runtime_wasm_wasi.o
clang-15: error: no such file or directory: 'lapack.o.tmp.o'
(lf) ubaid@ubaids-MacBook-Pro lf_mnist % /Users/ubaid/ext/wasi-sdk-19.0/bin/clang --target=wasm32-wasi -nostartfiles -Wl,--entry=_start -Wl,-lwasi-emulated-process-clocks -o my_wasm_app expr2.o lapack.out.tmp.o /Users/ubaid/Desktop/OpenSource/lfortran/src/bin/../runtime/lfortran_runtime_wasm_wasi.o
