class_name Answer

@export var id: String

@export var correct: bool

@export var text: String

static func fromJsonData(data: Dictionary) -> Answer:
    return Answer.new(
        data["id"],
        data["correct"],
        data["text"],
    )

func _init(_id: String, _correct: bool, _text: String):
    id = _id
    correct = _correct
    text = _text