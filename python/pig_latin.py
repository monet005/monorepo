#!/usr/bin/env python

import sys

vowels = ['a', 'e', 'i', 'o', 'u']

while True:
    word = input("Enter a word:\n")

    first_letter = word[0]
    if first_letter not in vowels:
        print('{}{}ay'.format(word[1:], first_letter, file=sys.stderr))
    else:
        print('{}way'.format(word, file=sys.stderr))

    try_again = input("Try again?\n")
    if try_again.lower() == "n":
        sys.exit()