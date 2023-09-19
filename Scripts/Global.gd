extends Node

var moedasPlayer0Atual = 0
var moedasPlayer0ComeçoFase = 0
var player0Health = 3

func dealDamagePlayer():
	Global.moedasPlayer0Atual = Global.moedasPlayer0ComeçoFase
	Global.player0Health -=1;
	if Global.player0Health == 0:
		get_tree().quit()
