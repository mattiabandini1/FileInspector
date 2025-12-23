#!/usr/bin/env bash

R="\e[31m"
G="\e[32m"
C="\e[36m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
W="\e[97m"

RES="\e[0m"

BOLD="\e[1m"
DIM="\e[2m"
U="\e[4m"

COLOR_BRAND="${C}"
COLOR_ACCENT="${C}${BOLD}"
COLOR_DIM="${DIM}${C}"
COLOR_SUCCESS="${G}"
COLOR_ERROR="${R}"

ICON_OK="${G}[✔]${RES}"
ICON_KO="${R}[✖]${RES}"

if (( $# != 1 )); then
    echo "Error, you need to pass a file as an argument"
    exit 1
fi

if (( $# != 1 )); then
    echo -e "${COLOR_ERROR}${BOLD}Error:${RESET} You need specify a target file."
    echo -e "${COLOR_BRAND}Use:${RESET} $0 <filename>"
    exit 1
fi

FILE="$1"

if [[ ! -f ${FILE} ]]; then
    echo "Error, the passed argument is not a file"
    exit 2
fi

FILE_USER=$(stat -c "%U" "${FILE}")
FILE_GROUP=$(stat -c "%G" "${FILE}")
FILE_OCTAL=$(stat -c "%a" "${FILE}")

# LOGICS

clear

if [[ -r ${FILE} ]]; then
    R_CHECK="${ICON_OK}"
    R_TEXT="${COLOR_SUCCESS}YES${RES}"
else
    R_CHECK="${ICON_KO}"
    R_TEXT="${COLOR_ERROR}NO${RES}"
fi

if [[ -w ${FILE} ]]; then
    W_CHECK="${ICON_OK}"
    W_TEXT="${COLOR_SUCCESS}YES${RES}"
else
    W_CHECK="${ICON_KO}"
    W_TEXT="${COLOR_ERROR}NO${RES}"
fi

if [[ -x ${FILE} ]]; then
    X_CHECK="${ICON_OK}"
    X_TEXT="${COLOR_SUCCESS}YES${RES}"
else
    X_CHECK="${ICON_KO}"
    X_TEXT="${COLOR_ERROR}NO${RES}"
fi

# UI

echo -e "${COLOR_ACCENT}"
cat << "EOF"
===================================================================
    _______ __        ____                           __
   / ____(_) /__     /  _/___  _________  ___  _____/ /_____  _____
  / /_  / / / _ \    / // __ \/ ___/ __ \/ _ \/ ___/ __/ __ \/ ___/
 / __/ / / /  __/  _/ // / / (__  ) /_/ /  __/ /__/ /_/ /_/ / /
/_/   /_/_/\___/  /___/_/ /_/____/ .___/\___/\___/\__/\____/_/
                                /_/
===================================================================
EOF
echo -e "${RES}"

echo -e "${COLOR_BRAND}${BOLD}TARGET INFO${RES}"
echo -e "${DIM}-----------${RES}"
printf "${BOLD}%-12s${RES} : ${DIM}%b${RES}\n" "File Name" "${FILE}${RES}"
printf "${BOLD}%-12s${RES} : ${DIM}%b${RES} : ${DIM}%b${RES}\n" "Owner" "${FILE_USER}" "${FILE_GROUP}"
printf "${BOLD}%-12s${RES} : ${DIM}%b${RES}\n" "Octal" "${FILE_OCTAL}"
echo ""

echo -e "${COLOR_BRAND}${BOLD}PERMISSIONS${RES}"
echo -e "${DIM}-----------${RES}"

printf "${BOLD}%-12b %-5b %b${RES}\n" "Type" "Check" "Status"
echo -e "${DIM}------------ ----- ------${RES}"

printf "${BOLD}%-12b${RES} %b   %b\n" "Read"    "${R_CHECK}" "${R_TEXT}"
printf "${BOLD}%-12b${RES} %b   %b\n" "Write"   "${W_CHECK}" "${W_TEXT}"
printf "${BOLD}%-12b${RES} %b   %b\n" "Execute" "${X_CHECK}" "${X_TEXT}"

echo ""
echo -e "${DIM}========================================${RES}"
echo "Analysis Complete."
echo ""
