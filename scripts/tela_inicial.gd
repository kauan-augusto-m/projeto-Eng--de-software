extends Control

func _on_botao_jogar_pressed():
	Jogo.indice_atual = 0
	Jogo.pontuacao_total = 0
	Jogo.ir_para_tela("res://scenes/tela_login.tscn")

func _on_botao_como_jogar_pressed():
	Jogo.ir_para_tela("res://scenes/tela_como_jogar.tscn")

func _on_botao_ranking_pressed():
	Jogo.ir_para_tela("res://scenes/tela_ranking.tscn")
