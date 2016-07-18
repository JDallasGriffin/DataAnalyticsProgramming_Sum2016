
# coding: utf-8

# In[14]:

import math
from bs4 import BeautifulSoup
from urllib2 import Request, urlopen, URLError

### Section 3
###########################################################################################################################

def readQuotes():
    quotes = []
    f = open('quotes.txt')
    while True:
        q = f.readline().rstrip('\n')
        if not q:
            break
        q += " - " + f.readline().rstrip('\n')
        quotes.append(q)
    return quotes

# DG 7/17 - imported String module and used it to remove all special characters from words
import string

def makeWords(quote):
    words = quote.lower().translate(string.maketrans("",""), string.punctuation).split()
    return words

def makePostingsDic(quotes):
    postingsDic = {}
    for quote in quotes:
        wordsDic = {}
        words = makeWords(quote)
        for word in words:
            if word in wordsDic:
                wordsDic[word] += 1
            else:
                wordsDic[word] = 1
        postingsDic[quote] = wordsDic
    return postingsDic

def makeReverseDic(quotes):
    reverseDic = {}
    allWordsList = []
    for quote in quotes:
        words = makeWords(quote)
        for word in words:
            if word in reverseDic:
                reverseDic[word] += 1
            else:
                reverseDic[word] = 1
    for i in reverseDic:
        allWordsList.append(i)
    reverseDic = {}
    for word in allWordsList:
        reverseDic[word] = 0
    
    for word in reverseDic:
        throwAway = {}
        for quote in quotes:
            quoteWords = makeWords(quote)
            for quoteWord in quoteWords:
                if word == quoteWord:
                    if quote in throwAway:
                        throwAway[quote] += 1
                    else:
                        throwAway[quote] = 1
        reverseDic[word] = throwAway
    return reverseDic

def computeTFIDF(w, q):
    words = makeWords(q)
    countDic = {}
    for word in words:
        if word in countDic:
            countDic[word] += 1
        else:
            countDic[word] = 1
    maxCount = max(countDic.values())
    wCount = countDic[w]
    TF = wCount * 1.0 / maxCount * 1.0
    IDF = math.log((len(postingsDic) * 1.0) / (len(reverseDic[w]) * 1.0))
    return TF * IDF

def quoteSearchSingle(w):
    inQuoteList = []
    searchDic = {}
    for quote in postingsDic:
        if w in makeWords(quote):
            inQuoteList.append(quote)
    for q in inQuoteList:
        searchDic[q] = computeTFIDF(w, q)
    return searchDic
    
def quoteSearchMultiple(wList):
    searchDic = {}
    for w in wList:
        inQuoteList = []
        for quote in postingsDic:
            if w in makeWords(quote):
                inQuoteList.append(quote)
        for q in inQuoteList:
            if q in searchDic:
                searchDic[q] += computeTFIDF(w,q)
            else:
                searchDic[q] = computeTFIDF(w,q)
    return searchDic
                

quotes = readQuotes()
postingsDic = makePostingsDic(quotes)
reverseDic = makeReverseDic(quotes)




