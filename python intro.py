#libraries
import random

def computerguess(lowval, highval, randnum, count=0):
    if highval >= lowval:
        guess = lowval + (highval - lowval) // 2
        if guess == randnum:
            return count
        elif guess > randnum:
            count = count + 1
            return computerguess(lowval, guess-1, randnum,count)
        else:
            count = count + 1 
            return computerguess(guess + 1, highval, randnum, count)
               
    else:
        return -1

#random numer generation
randnum = random.randint(1,101)

Count = 0
guess = -99
while ( guess != randnum):
    # Get the user's Guess 
    guess = (int) (input("Enter your Guess between 1 and 100"))
    if guess < randnum:
        print("Guess is Higher")
    elif guess > randnum:
        print("Guess is smaller")
    else:
        print("You guessed it!")
        break
    Count = Count + 1
#end of the while loop

print("You took " + str(Count) + " steps to guess the number")
print("computer took " + str(computerguess(0,100,randnum))+ " steps!")
