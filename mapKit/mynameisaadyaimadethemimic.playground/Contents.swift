import Foundation
import PlaygroundSupport

// Keep the playground alive while the async network call runs
PlaygroundPage.current.needsIndefiniteExecution = true

struct TriviaResponse: Decodable {
	let results: [TriviaQuestion]
}

struct TriviaQuestion: Decodable {
	let category: String
	let type: String
	let difficulty: String
	let question: String
	let correctAnswer: String
	let incorrectAnswers: [String]

	enum CodingKeys: String, CodingKey {
		case category, type, difficulty, question
		case correctAnswer = "correct_answer"
		case incorrectAnswers = "incorrect_answers"
	}
}

func fetchTriviaQuestions() {
	let url = URL(string: "https://opentdb.com/api.php?amount=10")!

	URLSession.shared.dataTask(with: url) { data, _, error in
		defer { PlaygroundPage.current.finishExecution() }

		if let error {
			print("Error: \(error.localizedDescription)")
			return
		}

		guard let data else { return }

		do {
			let response = try JSONDecoder().decode(TriviaResponse.self, from: data)
			for (index, q) in response.results.enumerated() {
				print("\(index + 1). [\(q.difficulty)] \(q.category)")
				print("   Q: \(q.question)")
				print("   A: \(q.correctAnswer)\n")
			}
		} catch {
			print("Decode error: \(error)")
		}
	}.resume()
}

fetchTriviaQuestions()
