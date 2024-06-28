class_name Question

@export var id: String

@export var difficulty: int

@export var text: String

@export var answers: Array

static func fromJsonData(data: Dictionary) -> Question:
    var _answers: Array[Answer] = []
    for answer_data: Dictionary in data["answers"]:
        _answers.append(Answer.fromJsonData((answer_data)))

    return Question.new(
        data["id"],
        data["difficulty"],
        data["question"],
        _answers
    )

func _init(_id: String, _difficulty: int, _text: String, _answers: Array):
    id = _id
    difficulty = _difficulty
    text = _text
    answers = _answers