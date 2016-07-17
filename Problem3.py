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

def makeWords(quote):
    words = quote.lower().split()
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

def computeTFIDF(word):
    mostUsedWord = ""
    quotesUsed = {}

#quotes = readQuotes()
#postingsDic = makePostingsDic(quotes)
#reverseDic = makeReverseDic(quotes)
