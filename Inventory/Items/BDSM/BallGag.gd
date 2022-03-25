extends ItemBase

func _init():
	id = "ballgag"

func getVisibleName():
	return "Ball Gag"
	
func getDescription():
	return "Can be used to gag those cheeky brats"

func getClothingSlot():
	return InventorySlot.Mouth

func getBuffs():
	return [
		buff(Buff.GagBuff),
		buff(Buff.AmbientLustBuff, [10]),
		]

func getTakeOffScene():
	return "RestraintTakeOffNopeScene"

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintBallGag.new()
	restraintData.setLevel(calculateBestRestraintLevel())
