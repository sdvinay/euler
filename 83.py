#!/usr/bin/python

matrix = [[131,673,234,103,18],
          [201,96,342,965,150],
          [630,803,746,422,111],
          [537,699,497,121,956],
          [805,732,524,37,331]]

ROWS = 5
COLS = 5

MAX_WEIGHT=999
MAX_DISTANCE=(ROWS+COLS)*MAX_WEIGHT

Distances = [[0 for x in range(COLS)] for x in range(ROWS)]
Distances[ROWS-1][COLS-1] = matrix[ROWS-1][COLS-1]

def getDistance(x,y):
    if x<0 or y<0 or x>=COLS or y>=ROWS:
        return MAX_DISTANCE
    if Distances[y][x] == 0:
        Distances[y][x] = MAX_DISTANCE # prevent infinite cycles
        h = getDistance(x-1, y)
        j = getDistance(x,y+1)
        k = getDistance(x,y-1)
        l = getDistance(x+1,y)
        Distances[y][x] = min(h,j,k,l) + matrix[y][x]
    return Distances[y][x]
        

