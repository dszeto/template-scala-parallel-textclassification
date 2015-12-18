#!/bin/bash

PIO_HOME=/Users/dszeto/demo/PredictionIO-0.9.5
LAMBDA_HOME=/Users/dszeto/rcx/advance/backend/target/universal/stage
ENGINE_INSTANCE_ID=`$LAMBDA_HOME/bin/lambda model log $1 | grep engineInstanceId | head -n 1 | cut -f2 -d= | tr -d '\n'`
if [ ! -z "$ENGINE_INSTANCE_ID" ]; then
  BUILD_ID=DONTKILL $PIO_HOME/bin/pio deploy --engine-instance-id $ENGINE_INSTANCE_ID &
  sleep 5
  disown
else
  $PIO_HOME/bin/pio build
  $PIO_HOME/bin/pio train -- --driver-memory 4g
  BUILD_ID=DONTKILL $PIO_HOME/bin/pio deploy &
  sleep 5
  disown
fi
