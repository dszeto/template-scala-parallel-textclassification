#!/bin/bash

PIO_HOME=/Users/dszeto/demo/PredictionIO-0.9.5

$PIO_HOME/bin/pio build
$PIO_HOME/bin/pio eval org.template.textclassification.AccuracyEvaluation org.template.textclassification.EngineParamsList
