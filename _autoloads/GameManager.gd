extends Node

enum GameState {
	MAIN_MENU,
	IN_GAME,
	PAUSED,
	GAME_OVER
}

var GameScenes := {
	GameState.MAIN_MENU: preload("res://ui/MainMenu.tscn"),
	GameState.IN_GAME: preload("res://scenes/Level.tscn")
}

var current_game_state: GameState

signal game_state_changed(new_state: GameState)


func _ready() -> void:
	if get_tree().current_scene == GameScenes[GameState.MAIN_MENU]:
		current_game_state = GameState.MAIN_MENU
	elif get_tree().current_scene == GameScenes[GameState.IN_GAME]:
		current_game_state = GameState.IN_GAME
	game_state_changed.emit(current_game_state)


func set_game_state(new_state: GameState) -> void:
	current_game_state = new_state
	game_state_changed.emit(new_state)


func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)


func quit_game() -> void:
	get_tree().quit()
