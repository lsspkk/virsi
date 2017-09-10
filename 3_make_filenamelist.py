import glob
import os

# jos virret on png2 -hakemistossa ja png-loppuiset
# tiedostonimet muotoa virsi_[0-9]{3}[ab]*.png
#
# esim. kaksisivuinen
#    virsi_142a0.png
#    virsi_142a1.png
#
# kasaa niistä vue:n data-alueelle tiedostolista näin
# python3 make_filenamelist.py > files.txt


lines = []
for f in sorted(glob.glob("png2/*.png")):
    f = os.path.basename(f)
    desc = "Virsi " + f[6:9]
    sivut = f.split('-')
    if len(sivut) == 2:
        desc = desc + ", sivu %d" % (int(sivut[1][0])+1)
    lines.append( "{ 'name':'%s', 'url': './dist/%s' }" %(desc,f) )

print( '[', ',\n'.join(lines), ']' )
