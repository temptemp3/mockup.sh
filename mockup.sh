#!/bin/bash
## mockup
## - generates images for mockup web design
## version 0.0.2 - default output format png
##################################################
mockup-find-images() {
 find . \
 -maxdepth 1 \
 -type f \
 -name \*jpg -o -name \*png
}
#-------------------------------------------------
mockup-convert-image() {
 echo ${image} ${count}
 file ${image}
 du -d 0 -h ${image}
 convert ${image} -resize 300x out/comp-${count}.${output_format-png}
}
#-------------------------------------------------
mockup-initialize() {
 test -d "out" || {
  mkdir out
 }
 count=1
}
#-------------------------------------------------
mockup() {
 local image
 local count
 ${FUNCNAME}-initialize
 for image in $( ${FUNCNAME}-find-images )
 do
  ${FUNCNAME}-convert-image
  count=$(( ${count} + 1 ))
 done
}
##################################################
if [ ${#} -eq 0 ] 
then
 true
else
 exit 1 # wrong args
fi
##################################################
mockup
##################################################
## generated by create-stub2.sh v0.1.1
## on Wed, 01 Aug 2018 14:52:34 +0900
## see <https://github.com/temptemp3/sh2>
##################################################
