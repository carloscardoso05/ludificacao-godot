extends Node

@export var screens: Array[Control] = []

func get_screen(type_int: int) -> Control:
    var filtered: Array[Control] =  screens.filter(func(screen): return typeof(screen) == type_int)
    if filtered.size() > 1: push_error("Mais de um tipo de tela")
    if filtered.size() == 0: push_error("Nenhuma tela desse tipo foi encontrada")
    return filtered[0]
