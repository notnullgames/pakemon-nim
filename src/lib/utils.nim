# loop-around mod (like python or C)
proc lmod*(n, M: int): int = ((n mod M) + M) mod M