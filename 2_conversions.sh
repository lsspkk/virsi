#!/bin/bash

#https://superuser.com/questions/156189/how-to-convert-word-doc-to-pdf-in-linux
#
# näin käännät libreofficella ubuntussa docit pdf:ksi

if [ "$1" = "1" ]; then
  cp -r doc pdf
  cd pdf
  for f in *.doc; do
    set -x
    lowriter --convert-to pdf "$f"
    set +x
  done
  cd ..



elif [ "$1" = "2" ]; then
  cp -r pdf png
  cd png
  for f in *.pdf; do
    b=${f%.*}.png
    set -x
    convert -density 300 "$f" "$b"
    set +x
  done
  cd ..

elif [ "$1" = "3" ]; then
  cd png
  for f in *.png; do
    b=${f%.*}.png
    set -x
    convert -flatten -density 300 "$f" "$b"
    set +x
  done
  cd ..


elif [ "$1" = "4" ]; then
  # tää skripti suunnilleen tästä
  # https://unix.stackexchange.com/questions/338224/how-to-select-only-numbers-from-file-names-in-bash-using-regex

  cd png
  mkdir ../png2
  for i in *.png; do
    old=$i
    [[ $i =~ virsi_([0-9]+)([ab]*)([\-01]*)\.png$ ]] && cp $old  $(printf "../png2/virsi_%03d%s%s.png" ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]})
  done
  cd ..


#
# vilkuilin tiedostoja, ja näytti siltä, että virret ja sanat oli vain vasemmassa laidassa
# en ole 100% varma, jotkut sanat saattaa tästä kadotakin
#
elif [ "$1" = "5" ]; then
  cd png2
  for f in *.png; do
    b=${f%.*}.png
    set -x
    mogrify -crop 1250x3100+180+240 +repage "$f" 
    set +x
  done
  cd ..


else
  echo "
  Käyttö:

  2_conversions 1  libreofficella muuntaa docit pdf:ksi

  2_conversions 2  imagemacikilla muuntaa pdf:t png:ksi

  2_conversions 3   imagemacikilla poistaa png:stä läpinäkyvän pohjan

  2_conversions 4   kopioi png2 -hakemistoon 3numeroiset virsinimet

  2_conversions 5   croppaillaan imagemacikilla valkosia alueita pois (en oo tsekannu 100% katoaako jotain)

  "

fi
