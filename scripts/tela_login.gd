extends Control

@onready var campo_nome = $CampoNome

func _on_botao_entrar_pressed():
	if campo_nome.text.strip_edges() != "":
		Jogo.nome_jogador = campo_nome.text
		Jogo.ir_para_tela("res://scenes/tela_inicial.tscn")
	else:
		$Label.text = "Digite seu nome para continuar!"
