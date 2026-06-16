// Swift Playground: Structs vs. Classes
// Explore the differences between Structs (Value Types) and Classes (Reference Types)

import SwiftUI

// MARK:  - Step 1: Define a Struct
// TODO: Create a struct called "PersonStruct" with properties "name" (String) and "age" (Int)
// Hint: Structs automatically generate initializers

struct PersonStruct {
	var name: String
	var age: Int
}

// Let's create an instance and copy it

var person1 = PersonStruct(name: "Tiffany", age: 21)
var person2 = person1
person1.name = "Diane"
print(person2.name) // name is still Tiffany

// MARK: - Step 2: Define a Class
// TODO: Create a class called "PersonClass" with properties "name" (String) and "age" (Int)
// Hint: Classes require an explicit initializer (init method)

class PersonClass {
	var name: String
	var age: Int
	
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
	
	var description: String {
		"My name is \(name)"
	}
	
	func greeting() {
		print("Hi, I'm \(name)!")
	}
	
}

// Let's create an instance and copy it

var person3 = PersonClass(name: "Derek", age: 25)
var person4 = person3
person3.name = "Alex"
print(person4.name) // name is also Alex

// MARK: - Step 3: Create a SubClass
// TODO: Create a class called "Student" with a property "grade" (Int) that inherits from PersonClass

class Student: PersonClass {
	var grade: Int
	
	init(name: String, age: Int, grade: Int) {
		self.grade = grade
		super.init(name: name, age: age)
	}
	
	override var description: String {
		super.description + " and my grade is \(grade)%"
	}
	
}

let student1 = Student(name: "Sam", age: 17, grade: 94)
print(student1.description) // My name is Sam and my grade is 94%
student1.greeting() // can still use greeting func because it's part of the parent class

// MARK: Step 4: When to Use Structs vs. Classes
// Scenario: Designing  a User Profile
// TODO: Implement a struct for user profile details that do NOT change (e.g., username, profileImage)
// TODO: Implement a class for user game statistics that DO change(e.g., score, level)


// MARK: - Step 5: Create and use an Enum
// TODO: Create an enum called 'Direction'
// TODO: Create a class called 'Journey' with a property 'destination' (String) and 'direction' (our enum)

enum Direction {
//	case north
//	case south
//	case east
//	case west
	
	case north, south, east, west
}

var direction = Direction.north
var direction1: Direction = .east

class Journey {
	let destination: String
	var direction: Direction
	
	init(destination: String, direction: Direction) {
		self.destination = destination
		self.direction = direction
	}
	
	func describeJourney() {
		print("Travelling to \(destination), going \(direction)")
	}
	
}

var journey1 = Journey(destination: "the store", direction: .north)
journey1.describeJourney() // travelling to the store, going north
