class_name Quiz

@export
var title: String

@export
var description: String

@export
var id: String

@export
var owner_id: String

@export
var questions: Array

static func fromJsonData(data: Dictionary) -> Quiz:
	var _questions: Array[Question] = []

	if data.keys().has("questions"):
		for question_data: Dictionary in data["questions"].values():
			_questions.append(Question.fromJsonData((question_data)))

	return Quiz.new(
		data["title"],
		data["description"],
		data["id"],
		data["owner_id"],
		_questions
	)

func _init(_title: String, _description: String, _id: String, _owner_id: String, _questions: Array):
	title = _title
	description = _description
	id = _id
	owner_id = _owner_id
	questions = _questions
