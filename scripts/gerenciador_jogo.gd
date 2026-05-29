extends Node

var nome_jogador: String = ""
var pontuacao_total: int = 0
var erros_fase_atual: int = 0
var estrelas_fase: Array = [0, 0]

var sequencia: Array = [
	"res://scenes/fase1/fase1_pergunta1.tscn",
	"res://scenes/tela_parabens.tscn",
	"res://scenes/fase1/fase1_pergunta2.tscn",
	"res://scenes/tela_parabens.tscn",
	"res://scenes/fase2/fase2_pergunta1.tscn",
	"res://scenes/fase2/fase2_pergunta2.tscn",
	"res://scenes/fase2/fase2_pergunta3.tscn",
    "res://scenes/tela_resultado.tscn"
]
var indice_atual: int = 0

func proxima_tela():
	indice_atual += 1
	if indice_atual < sequencia.size():
		get_tree().change_scene_to_file(sequencia[indice_atual])

func reiniciar_erros():
	erros_fase_atual = 0

func registrar_erro():
	erros_fase_atual += 1

func calcular_estrelas() -> int:
	if erros_fase_atual == 0:
		return 3
	elif erros_fase_atual <= 2:
		return 2
	else:
		return 1

func ir_para_tela(caminho: String):
	get_tree().change_scene_to_file(caminho)
