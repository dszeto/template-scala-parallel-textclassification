#!/bin/bash

PIO_HOME=/Users/dszeto/demo/PredictionIO-0.9.5

$PIO_HOME/bin/pio build
$PIO_HOME/bin/pio train -- --driver-memory 4g
