#!/bin/bash

PIO_HOME=/Users/dszeto/demo/PredictionIO-0.9.5
$PIO_HOME/bin/pio build
$PIO_HOME/bin/pio eval org.template.textclassification.AccuracyEvaluation org.template.textclassification.EngineParamsList
ACCURACY=`cat pio.log | grep Accuracy | tail -n 1 | cut -f2 -d: | awk '{$1=$1};1'`
THRESHOLD=0.93

if [ $(echo "$ACCURACY < $THRESHOLD" | bc) -eq 1 ]; then
  echo "Accuracy $ACCURACY is below threshold $THRESHOLD"
  exit 1
else
  echo "Accuracy $ACCURACY is above or equal to threshold $THRESHOLD"
  exit 0
fi
