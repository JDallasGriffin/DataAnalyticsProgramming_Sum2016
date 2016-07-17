# Problem 2)

fil = open('C:\\Users\\Sean\\Desktop\\MSBA\\MIS_Summer\\FloridaVoters.txt','r+')

def readtxt(fil):
    from operator import itemgetter
    text = fil.read()
    lineArray = text.split("\n")
    Masterlist = []
    for i in range(len(lineArray)):
        if lineArray[i] == "<tr>":
            dic ={}
            countyWithTag = lineArray[i+1]
            countyWithoutTD = countyWithTag[4:]
            county = countyWithoutTD[:-5]
            
            RepWithTag = lineArray[i+2]
            RepWithoutTD = RepWithTag[4:]
            Rep = RepWithoutTD[:-5]
            
            DWT = lineArray[i+3]
            DWOT = DWT[4:]
            Dem = DWOT[:-5]
            
            MinorWT = lineArray[i+4]
            MinorWT2 = MinorWT[4:]
            Minor = MinorWT2[:-5]
            
            NonWT = lineArray[i+5]
            NonWT2 = NonWT[4:]
            Non = NonWT2[:-5]
            
            TotalWT = lineArray[i+6]
            TotalWT2 = TotalWT[4:]
            Total = TotalWT2[:-5]
            if len(Masterlist)>0:
                Rep = int(Rep.replace(',', ''))
                Dem = int(Dem.replace(',', ''))
                Minor = int(Minor.replace(',', ''))
                Non = int(Non.replace(',', ''))
                Total = int(Total.replace(',', ''))
            dic = {
                "county":county,
                "rep":Rep,
                "dem":Dem,
                "minor":Minor,
                "none":Non,
                "total":Total
            }
            Masterlist.append(dic)
    MasterList = Masterlist[1:]
    MasterListI = []
    MasterList2 = sorted(MasterList, key=itemgetter('dem'))
    print "COUNTY     REP       DEM:"
    print " "
    for i in range(len(MasterList2)):
        t = MasterList2[i]
        print t["county"].upper(), " ", t["rep"], " ", t["dem"]


readtxt(fil)
fil.close()
    
