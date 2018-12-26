#!/usr/bin/env bash

TEST_ARGS="test it:compile"
STYLE_ARGS="scalastyle test:scalastyle it:scalastyle"
SCALARIFORM_ARGS="validateScalariformFormat"
DIST_ARGS="dist"

sbt clean $SCALARIFORM_ARGS $STYLE_ARGS $TEST_ARGS $DIST_ARGS cpd

