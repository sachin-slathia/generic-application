#!/usr/bin/env bash

COMPILE_ARGS="compile"
TEST_ARGS="test"
CHECK_STYLE="checkstyle:checkstyle"
PMD_ARGS="pmd:pmd"

mvn clean $COMPILE_ARGS $CHECK_STYLE $TEST_ARGS $PMD_ARGS

