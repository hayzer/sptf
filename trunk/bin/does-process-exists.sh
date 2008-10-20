#!/bin/bash
#===============================================================================
#
#          FILE:  process-exists.sh
# 
#         USAGE:  ./process-exists.sh 
# 
#   DESCRIPTION:  Example of test case for the SPTF
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Thomas Maier
#       COMPANY:  GNU
#       VERSION:  0.01
#       CREATED:  10/17/08 15:48:05 IST
#      REVISION:  ---
#===============================================================================


#-------------------------------------------------------------------------------
#   NOTE: (it's only example !!)
#   This test case checks if given proces ID exists or not
#-------------------------------------------------------------------------------
test -d /proc/${1} && exit 0 || exit 1


