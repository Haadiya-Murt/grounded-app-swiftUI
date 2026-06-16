/*
Welcome to the Constants and Variables Lab!

In this lab, we’ll explore how to use constants and variables in Swift.

- Constants (created with `let`) are values that don’t change.
- Variables (created with `var`) are values that can change.

Let’s dive in! 🚀
*/

// Exercise 1: Declaring a constant
// TODO: Declare a constant called `birthYear` and set it to your birth year.
let birthYear = 2009

// Exercise 2: Declaring a variable
// TODO: Declare a variable called `currentAge` and set it to your current age.
var currentAge = 16


// Exercise 3: Changing the value of a variable
// Imagine you’re a year older. Update `currentAge` to reflect this new age.
currentAge += 1


// Exercise 4: Trying to change a constant
// Uncomment the line below to see what happens when you try to change a constant!
// birthYear += 1
// Q: Why doesn’t this work?
// You are trying to change the constant's value. Changing a constant results in an error as constants are immutable and cannot be modified after their creation. Variables, on the other hand, are able to be changed after their declaration.

/*
Mini Build: Life Tracker (5 min)

Let’s build a small script that simulates tracking your age over the next few years.
1. Declare a constant for `myBirthYear`.
2. Declare a variable `currentYear` (set it to the current year).
3. Calculate your age by subtracting `myBirthYear` from `currentYear`.
4. Update `currentYear` to simulate each new year, and update your age.
 
Try adding print statements to track the changes.
*/

func lifeTracker(year: Int) -> String {
    let myBirthYear = 2009
    var age = year - myBirthYear
    return "You are \(age) years old."
}

var currentYear: Int = 2026
print(lifeTracker(year: currentYear))
currentYear += 1
print(lifeTracker(year: currentYear))



// Increment the year and age to simulate time passing

