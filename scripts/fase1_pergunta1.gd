extends Control

func _on_botao_confirmar_pressed():
	print("CONFIRMAR clicado!")
	var zonas = get_tree().get_nodes_in_group("zona_soltar")
	print("Zonas: ", zonas.size())
	var acertos = 0
	for zona in zonas:
		print("Zona: ", zona.name, " item_atual: ", zona.item_atual, " verificar: ", zona.verificar_acerto())
		if zona.verificar_acerto():
			acertos += 1
			zona.modulate = Color(0.5, 1.0, 0.5)
		else:
			zona.modulate = Color(1.0, 0.5, 0.5)
	print("Acertos: ", acertos, " de ", zonas.size())
	await get_tree().create_timer(1.5).timeout
	if acertos == zonas.size():
		Jogo.proxima_tela()
	else:
		for zona in zonas:
			zona.modulate = Color(1, 1, 1)
			zona.liberar_item()

func _on_botao_voltar_pressed():
	Jogo.ir_para_tela("res://scenes/tela_inicial.tscn")
