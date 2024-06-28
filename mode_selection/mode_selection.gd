## Tela de seleção de modo online ou local
extends TextureRect

## Signal emitido quando o botão [member ModeSelection.local_mode_btn] é pressionado
signal local_mode_selected

## Signal emitido quando o botão [member ModeSelection.online_mode_btn] é pressionado[br]
## Passa como argumentos o nome da sala [member ModeSelection.room_name] e o nome do jogador [member ModeSelection.player_name]
signal online_mode_selected(room_name: String, player_name: String)

## Botão que inicia o modo local
@export
var local_mode_btn: TextureButton

## Botão para inicia o modo online[br]
## Se a sala com o nome definido em [member ModeSelection.room_name] existir, entra nela, senão, uma sala é criada com esse nome
@export
var online_mode_btn: TextureButton

## Campo de inserção do nome do jogador
@export
var player_name_input: TextEdit

## Campo de menssagem de erro
@export
var error_message: Label

## Campo de inserção do nome da sala
@export
var room_name_input: TextEdit

## Nome do jogador
@export
var player_name: String

## Nome da sala que será acessada ou criada
@export
var room_name: String

func _ready():
	player_name_input.text_changed.connect(
		func(_name: String):
			error_message.text=""
			player_name=_name.strip_edges(true, true)
			if player_name.is_empty():
				print("player name is empty")
				error_message.text="Insira seu nome de jogador"
	)

	room_name_input.text_changed.connect(
		func(_name: String):
			print("room chang")
			error_message.text=""
			room_name=_name.strip_edges(true, true)
			if room_name.is_empty():
				print("room name is empty")
				error_message.text="Insira o nome da sala para jogar"
	)

	local_mode_btn.pressed.connect(
		func():
			if error_message.text.is_empty():
				local_mode_selected.emit()
	)

	online_mode_btn.pressed.connect(
		func():
			if error_message.text.is_empty():
				online_mode_selected.emit(room_name, player_name)
	)
