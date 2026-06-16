// Introduction to Optionals

// Task 1: Declaring Optionals
// Step 1: Declare an optional string named "favouriteMovie"

var favouriteMovie: String?

// Step 2: Print "favouriteMovie" to see what happens when it has no value
print(favouriteMovie)

// Step 3: Assign a value to "favouriteMovie" and print it again
favouriteMovie = "Pacific Rim"
print(favouriteMovie)

// Task 2: Unwrapping Optionals with if let

// Step 1: Using if let to safely unwrap "favouriteMovie" and print it
if let unwrappedMovie = favouriteMovie {
	print(unwrappedMovie)
} else {
	print("No favourite movie")
}

// Step 2: Set "favouriteMovie" to nil and try unwrapping it again


// Task 3: Using Guard to Unwrap Optionals
// Step 1: Write a function that takes an optional String (name) and prints a welcome message

func greeting(name: String?) {
	guard let unwrappedName = name else {
		print("Welcome, stranger")
		return
	}
	
	print("Hello, \(unwrappedName)")
}

// Test the function with a name
greeting(name: "Debra")

// Test the function with nil
greeting(name: nil)


// Task 4: Optional Chiaining
// Step 1: Create a struct called "Book" with a title (String) and author (String?)

struct Book {
	let title: String
	let author: Author?
}

struct Author {
	let firstName: String?
	let lastName: String
}


// Step 2: Declare an instance of "Book" with a title and an author
let author = Author(firstName: "Suzanne", lastName: "Collins")
let book = Book(title: "The Hunger Games", author: author)

// Step 3: Print the author's name using optional chaining
if let authorFirstName = book.author?.firstName {
	print("\(authorFirstName) \(book.author!.lastName)")
}


// Step 4: Declare another instance of "Book" without an author and print author name
let book2 = Book(title: "Catching Fire", author: nil)
if let bookAuthor = book2.author {
	print(bookAuthor)
} else {
	print("The author is unknown")
}
