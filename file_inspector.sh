#!/usr/bin/env bash

if (( $# != 1 )); then
    echo "Errore, devi passare esattamente un file come argomento"
    exit 1
fi

FILE="$1"

if [[ ! -f ${FILE} ]]; then
    echo "Errore, l'argomento passato non è un file"
    exit 2
fi

# Rimosso l'else, il codice prosegue lineare
echo "Analisi del file ${FILE}"

if [[ -r ${FILE} ]]; then
    echo "Lettura: SI"
else
    echo "Lettura: NO"
fi

if [[ -w ${FILE} ]]; then
    echo "Scrittura: SI"
else
    echo "Scrittura: NO"
fi

if [[ -x ${FILE} ]]; then
    echo "Esecuzione: SI"
else
    echo "Esecuzione: NO"
fi
