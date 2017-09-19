
# jos virret on png2 -hakemistossa ja png-loppuiset
# tiedostonimet muotoa virsi_[0-9]{3}[ab]*.png
#
# esim. kaksisivuinen
#    virsi_142a0.png
#    virsi_142a1.png
#
# kasaa niistä vue:n data-alueelle tiedostolista näin
# python3 make_filenamelist.py > files.txt


from bs4 import BeautifulSoup
import json
with open("virsiluettelo_wikipediasta.html") as fp:
    soup = BeautifulSoup(fp, "lxml")
    table = soup.table
    table = table.find_next("table")
    rows = table.find_all('tr')
    hymns = [[c.get_text() for c in row.find_all('td')[0:2]] for row in rows]
    two = [h for h in hymns if len(h) == 2]
    hymns = []
    for h in two:
        hymns.append({"numero":h[0][:-1], "nimi":h[1]})

    print(json.dumps(hymns, indent=4, ensure_ascii=False))
    #print( "[")
    #print( *hymns, sep=',\n' )
    #print("]")
