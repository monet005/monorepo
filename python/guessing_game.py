#!/usr/bin/env python

import random

guess_count=0

print('What is your name?')
name = input()
print("Let's play a guessing game, {}".format(name.title()))
      
number = random.randint(1, 20)

print("Give a number from 1 to 20")


for guess_count in range(6):
    guess = int(input())
    if guess > number:
        print("lower")
    
    if guess < number:
        print("higher")
    
    if guess == number:
        break
    
if guess == number:
    guess_count = guess_count + 1
    print("Goodjob {}!, you have guessed the number in {} tries.".format(guess_count))

if guess != number:
    print("Try next time, the correct number is {}".format(number))
