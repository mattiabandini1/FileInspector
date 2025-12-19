#!/usr/bin/env bash

R="\e[31m"
G="\e[32m"
RES="\e[0m"

BOLD="\e[1m"

ICON_OK="${G}[✔]${RES}"
ICON_KO="${R}[✖]${RES}"

if (( $# != 1 )); then
    echo "Error, you need to pass a file as an argument"
    exit 1
fi

FILE="$1"

if [[ ! -f ${FILE} ]]; then
    echo "Error, the passed argument is not a file"
    exit 2
fi

# LOGICS

clear

if [[ -r ${FILE} ]]; then
    R_ICON="${ICON_OK}"
    R_TEXT="${G}YES${RES}"
else
    R_ICON="${ICON_KO}"
    R_TEXT="${R}NO${RES}"
fi

if [[ -w ${FILE} ]]; then
    W_ICON="${ICON_OK}"
    W_TEXT="${G}YES${RES}"
else
    W_ICON="${ICON_KO}"
    W_TEXT="${R}NO${RES}"
fi

if [[ -x ${FILE} ]]; then
    X_ICON="${ICON_OK}"
    X_TEXT="${G}YES${RES}"
else
    X_ICON="${ICON_KO}"
    X_TEXT="${R}NO${RES}"
fi

# UI

echo "========================================"
echo "       FILE INSPECTOR v0.2.0           "
echo "========================================"
echo ""

echo "TARGET INFO"
echo "-----------"
printf "File Name : %s\n" "${FILE}"
echo ""

echo "PERMISSIONS"
echo "-----------"

printf "${BOLD}%-12b %-5b %b${RES}\n" "Type" "Check" "Status"
echo "------------ ----- ------"

printf "${BOLD}%-12b${RES} %-5b %b\n" "Read"    "${R_ICON}" "${R_TEXT}"
printf "${BOLD}%-12b${RES} %-5b %b\n" "Write"   "${W_ICON}" "${W_TEXT}"
printf "${BOLD}%-12b${RES} %-5b %b\n" "Execute" "${X_ICON}" "${X_TEXT}"

echo ""
echo "========================================"
echo "Analysis Complete."
echo ""
