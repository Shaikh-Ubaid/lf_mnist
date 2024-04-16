#!/usr/bin/env bash

# gfortran -c examples/expr2.f90 examples/dgemv.f examples/lsame.f examples/xerbla.f -o tmp

lfortran -c examples/expr2.f90 -o main.o --implicit-interface --generate-object-code
lfortran -c examples/dgemv.f -o dgemv.o --implicit-interface --fixed-form --generate-object-code
lfortran -c examples/lsame.f -o lsame.o --implicit-interface --fixed-form --generate-object-code
lfortran -c examples/xerbla.f -o xerbla.o --implicit-interface --fixed-form --generate-object-code
