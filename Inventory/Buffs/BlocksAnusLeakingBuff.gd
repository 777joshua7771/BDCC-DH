extends BuffBase

func _init():
	id = Buff.BlocksAnusLeakingBuff

func getVisibleDescription():
	return "Keeps cum from leaking out of butt"

func apply(_buffHolder):
	_buffHolder.blockedOrifices[OrificeType.Anus] = true

func getBuffColor():
	return DamageType.getColor(DamageType.Lust)
