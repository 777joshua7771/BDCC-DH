extends Character

func _init():
	id = "captain"
	
func _getName():
	return "Cpt. Wright"

func getGender():
	return Character.Gender.Male
	
func getSmallDescription() -> String:
	return "Canine with black fur. Very formal clothing"

func getSpecies():
	return ["wolf"]