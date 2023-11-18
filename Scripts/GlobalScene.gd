extends Node2D

func _ready():
	var musica = load("res://Musicas/Musica_do_jogo_da_galinha2.0.wav")
	$AudioStreamPlayer.stream = musica
	$AudioStreamPlayer.volume_db = -10
	pass
	
func _process(_delta):
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play(0)
	pass
