extends Control

@export var id_item: String = ""
var arrastando: bool = false
var posicao_original: Vector2
var offset: Vector2

func _ready():
	posicao_original = global_position

func _gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				arrastando = true
				offset = global_position - get_global_mouse_position()
				move_to_front()
			else:
				arrastando = false
				verificar_zona()
	if event is InputEventMouseMotion and arrastando:
		global_position = get_global_mouse_position() + offset

func verificar_zona():
	print("Verificando zona. ID do item: ", id_item)
	var zonas = get_tree().get_nodes_in_group("zona_soltar")
	print("Zonas encontradas: ", zonas.size())
	for zona in zonas:
		print("Zona: ", zona.name, " rect: ", zona.get_global_rect())
		print("Mouse pos: ", get_global_mouse_position())
		if zona.get_global_rect().has_point(get_global_mouse_position()):
			print("Acertou zona!")
			zona.receber_item(self)
			return
	voltar_origem()
func voltar_origem():
	var tween = create_tween()
	tween.tween_property(self, "global_position", posicao_original, 0.3)
