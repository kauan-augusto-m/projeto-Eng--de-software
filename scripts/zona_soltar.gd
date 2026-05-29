extends Control

@export var id_aceito: String = ""
var item_atual = null

func _ready():
	add_to_group("zona_soltar")
	if id_aceito == "":
		if name == "ZonaBom":
			id_aceito = "solar"
		elif name == "ZonaRuim":
			id_aceito = "carvao"

func receber_item(item):
	if item_atual != null:
		item_atual.voltar_origem()
	item_atual = item
	var centro_zona = global_position + size / 2
	item.global_position = centro_zona - item.get_rect().size / 2
	

func verificar_acerto() -> bool:
	if item_atual == null:
		return false
	return item_atual.id_item == id_aceito

func liberar_item():
	if item_atual != null:
		item_atual.mouse_filter = Control.MOUSE_FILTER_STOP
	item_atual = null
	
func _on_botao_voltar_pressed():
	Jogo.ir_para_tela("res://scenes/tela_inicial.tscn")
