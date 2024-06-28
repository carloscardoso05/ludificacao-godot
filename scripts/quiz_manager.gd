extends Node

## Signal emitido quando um quiz é selecionado
signal quiz_selected(quiz: Quiz)

## Signal emitido quando os quizzes são carregados por meio de [method QuizManager.save_quizzes]
signal quizzes_loaded(quizzes: Dictionary)

## Url da requisição para carregar os quizzes
const _repository_url: String = "https://quizvaultapp-ea5fb-default-rtdb.firebaseio.com/quizzes.json"

## Requisição Http
@export var http: HTTPRequest = Http

## Quizzes públicos e não vazios do banco de dados
@export var quizzes: Dictionary = {}

## [class Quiz] atual (selecionado)[br]
## Emite [signal QuizManager.quiz_selected] quando alterado
var current_quiz: Quiz:
    set(v):
        current_quiz = v
        quiz_selected.emit(current_quiz)

## Método que salva os quizzes a partir da requisição http[br]
## Converte o JSON do [_body] da requisição em um [class Dictionary] de [class Quiz] e salva em [member QuizManager.quizzes][br]
## Emite [signal QuizManager.quizzes_loaded] quando executada com sucesso
func save_quizzes(_result: int, _response_code: int, _headers: PackedStringArray, body: PackedByteArray):
    var json: Dictionary = JSON.parse_string(body.get_string_from_utf8())
    assert(json != null, "Erro ao converter JSON dos quizzes")
    for key in json.keys():
        var quiz: Quiz = Quiz.fromJsonData(json[key])
        if quiz.questions.size() == 0: continue # Não adiciona o quiz se ele possuir nenhuma questão
        quizzes[key] = quiz
    quizzes_loaded.emit(quizzes)

func _ready():
    http.request_completed.connect(save_quizzes)
    http.request(_repository_url)
