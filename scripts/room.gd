## Sala do multiplayer
class_name Room
extends Control

## Signal emitido quando [member Room.start_btn] é pressionado
signal start_btn_pressed

## Signal emitido quando [member Room.config_btn] é pressionado
signal config_btn_pressed

## Label para exibir o nome da sala
@export
var room_name: Label

## Label para exibir o título do quiz selecionado
@export
var quiz_title: Label

## Lista dos jogadores presentes na sala
@export
var players_list: VBoxContainer

## Botão para abrir as configurações da partida
@export
var config_btn: TextureButton

## Botão para selecionar o quiz da partida
@export
var select_quiz_btn: TextureButton

## Botão para iniciar a partida
@export
var start_btn: TextureButton

func _ready():
    pass