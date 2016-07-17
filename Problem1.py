def human_choice():
    choice = str(raw_input("Please type your choice of Rock, Paper, Scissors or Quit: "))
    cl = choice.lower()
    while cl != "rock" and cl!= "paper" and cl!= "scissors" and cl!= "quit":
        choice = str(raw_input("Please type your choice of Rock, Paper, Scissors or Quit: "))
        cl = choice.lower()
    return cl
    
def most_common(past):
    if len(past)==0:
        return "first"
    else:
        rock_count = 0
        paper_count = 0
        scissors_count = 0
        for i in past:
            if i == "rock":
                rock_count += 1
            elif i == "paper":
                paper_count += 1
            elif i == "scissors":
                scissors_count += 1
        st = []
        if rock_count >= scissors_count and rock_count >= paper_count :
            st.append("rock")
        if paper_count >= scissors_count and rock_count <= paper_count:
            st.append("paper")
        if scissors_count >= rock_count and scissors_count >= paper_count:
            st.append("scissors")
        return st

import random
def computer_choice(past):
    common = most_common(past)
    choices = ["rock","paper","scissors"]
    if len(common) == 1:
        if common[0] == "first":
            t = random.randint(0,2)
            return choices[t]
        else:
            c = common[0]
            if c == "paper":
                return "scissors"
            elif c == "rock":
                return "paper"
            elif c == "scissors":
                return "rock"
    else:
        y = len(common)
        x = random.randint(0,y-1)
        c = common[x]
        if c == "paper":
            return "scissors"
        elif c == "rock":
            return "paper"
        elif c == "scissors":
            return "rock"


# This function compares the human and computer inputs, returns 2 for a draw, 
# 1 if the human wins, and 0 if the computer wins
def compare(human,computer):
    if human == "rock":
        if computer == "paper":
            return 0 
        elif computer == "rock":
            return 2
        elif computer == "scissors":
            return 1
    elif human == "paper":
        if computer == "paper":
            return 2 
        elif computer == "rock":
            return 1
        elif computer == "scissors":
            return 0
    elif human == "scissors":
        if computer == "paper":
            return 1 
        elif computer == "rock":
            return 0
        elif computer == "scissors":
            return 2


# def lets_play():
    past_human_choices =[]
    games_played = 0
    human_wins = 0
    while True:
        human = human_choice()
        if human == "quit":
            print "You played ", games_played
            print "You won ", human_wins
            break
        else:
            games_played += 1
            past_human_choices.append(human)
            computer = computer_choice(past_human_choices)
            y = compare(human, computer)
            print "The computer chose ", computer
            if y == 1:
                human_wins += 1
                print "You won!"
            elif y == 0:
                print "I won!"
            elif y ==2:
                print "It seems we have a draw"

lets_play()


