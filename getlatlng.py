# 'dataset' holds the input data for this script
import pandas as pd

def getlocationcntlatlng(instr):

    nkey = ''
    cnt_lat = 0
    cnt_lng = 0
    width = 180
    height = 90
    cnt = 0
    result = 0

    for c in instr:
        cnt = cnt + 1
        width = width/2
        height = height/2
        if(c=='a'):
            cnt_lat = cnt_lat + (height * +1)
            cnt_lng = cnt_lng + (width * -1)
        elif(c=='b'):
             cnt_lat = cnt_lat + (height* +1)
             cnt_lng = cnt_lng + (width * +1)
        elif(c=='c'):
             cnt_lat = cnt_lat + (height* -1)
             cnt_lng = cnt_lng + (width * -1)
        elif(c=='d'):
             cnt_lat = cnt_lat + (height* -1)
             cnt_lng = cnt_lng + (width * +1)
        nkey = nkey + c

    if(nkey == instr):
        result = str(cnt_lat) + ";" + str(cnt_lng)
    else:
        result = "not complete"

    return result


dataset['latlng'] = dataset['key'].apply(getlocationcntlatlng)
