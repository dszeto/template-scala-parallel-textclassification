#!/bin/bash -ex

PIO_HOME=/Users/dszeto/demo/PredictionIO-0.9.5
LAMBDA_HOME=/Users/dszeto/rcx/advance/backend/target/universal/stage

if [ ! -z "$1" ]; then
  ENGINE_INSTANCE_ID=`$LAMBDA_HOME/bin/lambda model log $1 | grep engineInstanceId | cut -f2 -d= | tr -d '\n'`
  $PIO_HOME/bin/pio deploy --engine-instance-id $ENGINE_INSTANCE_ID &
else
  $PIO_HOME/bin/pio build
  $PIO_HOME/bin/pio train -- --driver-memory 4g
  $PIO_HOME/bin/pio deploy &
fi
