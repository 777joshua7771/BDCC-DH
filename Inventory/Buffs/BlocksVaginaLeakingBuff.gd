extends BuffBase

func _init():
	id = Buff.BlocksVaginaLeakingBuff

func getVisibleDescription():
	return "Keeps cum from leaking out of pussy"

func apply(_buffHolder):
	_buffHolder.blockedOrifices[OrificeType.Vagina] = true

func getBuffColor():
	return DamageType.getColor(DamageType.Lust)
