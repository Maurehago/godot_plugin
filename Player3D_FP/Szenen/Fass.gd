extends RigidBody

# Texte
export var textAufheben = "aufheben"
export var textFallenLassen = "fallen lassen"

# wenn transportiert wird
var isTransport = false

# Wenn Player in der nähe
func player_interact(Player):
	# Wenn Gegenstand bereits vom "Player" transportiert wird
	if isTransport:
		return textFallenLassen
	else:
		# Wenn Player nichts in der Hand
		if !Player.isHolding:
			return textAufheben


# wenn Player was will
func do_action (Player):
	# Wenn Gegenstand bereits vom "Player" transportiert wird
	if isTransport:
		# Objekt vom Player trennen
		Player.release_object()
		isTransport = false
		
	else:
		# Wenn player noch nichts in der Hand
		if Player.pickup_object(self):
			# Position merken
			isTransport = true
			