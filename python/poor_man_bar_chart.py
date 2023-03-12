#!/usr/bin/env python

from collections import defaultdict
import pprint
import sys

while True:
    sentence = input("Enter a sentence:\n")
    letters = []

    for letter in list(sentence):
        lowercase_letter = letter.lower()
        letters.append((lowercase_letter, lowercase_letter))

    d = defaultdict(list)
    for k, v in letters:
        d[k].append(v)

    pprint.pprint(d)

    try_again = input("Try again?\n")
    if try_again.lower() == "n":
        sys.exit()