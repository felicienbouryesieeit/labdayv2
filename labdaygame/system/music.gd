extends AudioStreamPlayer

signal music_stopped

const VOLUME_MIN = -60.0
const VOLUME_MAX = 0.0

# Déclaration d'une variable personnalisée pour gérer le volume
var custom_volume_db

func _ready():
	custom_volume_db = 0.0  # Initialisation du volume personnalisé


# Fonction pour définir le volume
func set_custom_volume_db(value: float):
	custom_volume_db = clamp(value, VOLUME_MIN, VOLUME_MAX)
	volume_db = custom_volume_db  # Mise à jour de la propriété native volume_db


# Fonction pour récupérer le volume personnalisé
func get_custom_volume_db() -> float:
	return custom_volume_db


func change_music(audio_stream: AudioStream):
	if stream:
		if stream == audio_stream:
			return
		await stop_music()
	play_music(audio_stream)


func play_music(audio_stream: AudioStream):
	stream = audio_stream
	set_custom_volume_db(0.0)  # Définit le volume à 0 dB
	play()


func stop_music(time: float = 1.0):
	if time <= 0.0:
		stream = null
	else:
		var tween = create_tween()
		tween.tween_property(self, "volume_db", VOLUME_MIN, time)
		await tween.finished
		music_stopped.emit()
		stream = null
