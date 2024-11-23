class_name CardPile
extends Resource

signal card_pile_size_changed(cards_amount)

@export var cards : Array[Card] = []

func empty() -> bool:
	return cards.is_empty()

func draw_card() -> Card:
	var card cards.pop_front()
	card_pile_size_changed.emit()(cards.size())

func add_card(card: Card):
	cards.append(card)
	card_pile_size_changed.emit(cards.size())
