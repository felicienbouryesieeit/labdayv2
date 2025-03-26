extends Node

@onready var music_player = $MusicPlayer

var music_volume: float = 1.0
var sfx_volume: float = 1.0

func _ready():
	set_music_volume(music_volume)
	set_sfx_volume(sfx_volume)

func play_music(audio_stream: AudioStream):
	music_player.change_music(audio_stream)

func stop_music():
	await music_player.stop_music()

func set_music_volume(value: float):
	music_volume = clamp(value, 0.0001, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(music_volume))

func set_sfx_volume(value: float):
	sfx_volume = clamp(value, 0.0001, 1.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))
