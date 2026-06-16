//: ## Control Flow Playground
//: Welcome to the Control Flow Playground! In this lab, you’ll be working with `if`, `else if`, and `else` statements to control the flow of your program based on different conditions. Let’s get started!

//: ### Step 1: Create a Variable for Age
//: Create a variable called `age` and assign it a number between 10 and 50. This will represent someone's age.

var age = 11


//: ### Step 2: Use an If Statement to Check Age
//: Write an `if` statement to check if the person is an adult or a minor.
//: If the age is greater than or equal to 18, print "You are an adult".
//: If the age is less than 18, print "You are a minor".

//: Complete the if-else statement below
if age >= 18 {
    print("You are an adult")
} else if 13 <= age && age <= 19 {
    print("You are a teenager.")
} else {
    print("You are a minor.")
}


//: ### Step 3: Add an Else If Condition
//: Now, let's add an `else if` condition to check if the person is a teenager.
//: If the age is between 13 and 19 (inclusive), print "You are a teenager".

//: Update the code below to include an `else if` for teenagers


//: ### Step 4: Test with Different Ages
//: Test your code by changing the value of `age` to see different outputs.


//: ### Step 5: Create a Temperature Checker
//: Let's create a new program that checks the temperature. Write an `if` statement to check the value of a variable called `temperature`.
//: If the temperature is greater than or equal to 80, print "It's hot outside!".
//: If the temperature is between 60 and 79, print "It's a pleasant day!".
//: Otherwise, print "It's cold outside!".

//: Complete the temperature checker below
var temperature = 75 // Set the temperature here

if temperature >= 80 {
    print("It's hot outside!")
} else if 60 <= temperature && 79 <= temperature {
    print("It's a pleasant day!")
} else {
    print("It's cold outside!")
}

//: ### Mini Build Challenge: Create a Grade Checker
//: Now, let's apply what you've learned! Create a variable called `grade` and set it to a value between 0 and 100.
//: Use `if`, `else if`, and `else` to print the following messages based on the grade:
//: - 90 - 100: "Excellent!"
//: - 80 - 89: "Great job!"
//: - 70 - 79: "Good effort!"
//: - 60 - 69: "You passed!"
//: - Below 60: "Try harder next time."

//: Complete the grade checker below
var grade = 0 // Set the grade here

if grade >= 90 && grade <= 100 {
    print("Excellent!")
} else if 80 <= grade && 89 <= grade {
    print("Great job!")
} else if 70 <= grade && 79 <= grade {
    print("Good effort!")
} else if 60 <= grade && 69 <= grade {
    print("You passed!")
} else {
    print("Try harder next time.")
}
