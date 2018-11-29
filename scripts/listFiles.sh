#!/bin/bash

ID=$1
F1=$2
F2=$3

reset="\e[0m"
bold="\e[1m"
underline="\e[4m"
red="\e[31m"
green="\e[32m"
gray="\e[90m"

echo
echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing smil's${reset}"
echo
SMIL_PATH="/jiomediadata/content/entry/data/$F1/$F2"
ls $SMIL_PATH/*$ID*.smil |  awk -v path="$SMIL_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $SMIL_PATH/*$ID*.smil | awk -F "/" '{print $8}'
echo


echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing mp4's${reset}"
echo
SMIL_PATH="/jiomediadata/content/entry/data/$F1/$F2"
ls $SMIL_PATH/*$ID*.mp4 |  awk -v path="$SMIL_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $SMIL_PATH/*$ID*.mp4 | awk -F "/" '{print $8}'
echo


echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing m3u8's${reset}"
echo
M3U8_PATH="/jiomediadata/vod/_definst_/smil\:hdivod/$F1/$F2"
ls $M3U8_PATH/${ID}.smil/* |  awk -v path="$M3U8_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $M3U8_PATH/${ID}.smil/* | awk -F "/" '{print $9}'
echo

echo -e "${red}<<<<<<<<< WIDEWINE ENCRYPTION >>>>>>>>>>>>${reset}"

echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing mpd's${reset}"
echo
MPD_PATH="/jiomediadata/content/entry/wvdata/$F1/$F2"
ls $MPD_PATH/*$ID*.mpd |  awk -v path="$MPD_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $MPD_PATH/*$ID*.mpd | awk -F "/" '{print $8}'
echo

echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing mp4's${reset}"
echo
MPD_PATH="/jiomediadata/content/entry/wvdata/$F1/$F2"
ls $MPD_PATH/*$ID*.mp4 |  awk -v path="$MPD_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $MPD_PATH/*$ID*.mp4 | awk -F "/" '{print $8}'
echo

echo -e "${green}<<<<<<<<< KEY's >>>>>>>>>>>>${reset}"

echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing AES key's${reset}"
echo
AES_PATH="/jiomediadata/content/entry/aes_encryption/vod/$F1/$F2"
ls $AES_PATH/*$ID*.key |  awk -v path="$AES_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $AES_PATH/*$ID*.key | awk -F "/" '{print $9}'
echo


echo -e "${gray}==============================================================${reset}"
echo -e "${underline}${bold}Listing FPS key's${reset}"
echo
FPS_PATH="/jiomediadata/content/entry/fps/$F1/$F2"
ls $FPS_PATH/*$ID*.key |  awk -v path="$FPS_PATH"  'END{print "PATH: ",path ;print "TOTAL FILES: ",NR}'
echo
echo -e "${gray}--------------------------------------------------------------${reset}"
echo
ls $FPS_PATH/*$ID*.key | awk -F "/" '{print $8}'
echo    