extends Character
class_name DynamicCharacter

var npcName = "BAD NAME"
var npcSpecies = ["canine"]
var npcGender = Gender.Male
var npcSmallDescription = "One of the generated characters"
var npcThickness = 70
var npcFeminity = 0
var npcDefaultEquipment = []

func _getName():
	return npcName

func getGender():
	return npcGender
	
func getSmallDescription() -> String:
	return npcSmallDescription

func getSpecies():
	return npcSpecies
	
func getThickness() -> int:
	return npcThickness

func getFemininity() -> int:
	return npcFeminity

func createBodyparts():
	pass

func getDefaultEquipment():
	return npcDefaultEquipment

func createEquipment():
	for itemID in getDefaultEquipment():
		getInventory().equipItem(GlobalRegistry.createItemNoID(itemID))


func saveData():
	var data = {
		"pain": pain,
		"lust": lust,
		"stamina": stamina,
		"arousal": arousal,
		"consciousness": consciousness,
		"npcName": npcName,
		"npcSpecies": npcSpecies,
		"npcGender": npcGender,
		"npcSmallDescription": npcSmallDescription,
		"npcThickness": npcThickness,
		"npcFeminity": npcFeminity,
	}
	
	data["bodyparts"] = {}
	for slot in bodyparts:
		if(bodyparts[slot] == null):
			data["bodyparts"][slot] = null
			continue
		
		data["bodyparts"][slot] = {
			"id": bodyparts[slot].id,
			"data": bodyparts[slot].saveData(),
		}
	
	data["statusEffects"] = saveStatusEffectsData()
	data["inventory"] = inventory.saveData()
	data["lustInterests"] = lustInterests.saveData()
	if(menstrualCycle != null):
		data["menstrualCycle"] = menstrualCycle.saveData()

	data["timedBuffs"] = saveBuffsData(timedBuffs)
	data["timedBuffsDurationSeconds"] = timedBuffsDurationSeconds
	data["timedBuffsTurns"] = saveBuffsData(timedBuffsTurns)
	data["timedBuffsDurationTurns"] = timedBuffsDurationTurns
	
	
	data["lastUpdatedDay"] = lastUpdatedDay
	data["lastUpdatedSecond"] = lastUpdatedSecond
	
	return data

func loadData(data):
	pain = SAVE.loadVar(data, "pain", 0)
	lust = SAVE.loadVar(data, "lust", 0)
	stamina = SAVE.loadVar(data, "stamina", 100)
	arousal = SAVE.loadVar(data, "arousal", 0.0)
	consciousness = SAVE.loadVar(data, "consciousness", 1.0)
	npcName = SAVE.loadVar(data, "npcName", "Error")
	npcSpecies = SAVE.loadVar(data, "npcSpecies", ["canine"])
	npcGender = SAVE.loadVar(data, "npcGender", Gender.Male)
	npcSmallDescription = SAVE.loadVar(data, "npcSmallDescription", "No description")
	npcThickness = SAVE.loadVar(data, "npcThickness", 50)
	npcFeminity = SAVE.loadVar(data, "npcFeminity", 50)
	
	resetSlots()
	var loadedBodyparts = SAVE.loadVar(data, "bodyparts", {})
	for slot in loadedBodyparts:
		if(loadedBodyparts[slot] == null):
			bodyparts[slot] = null
			continue
		var id = SAVE.loadVar(loadedBodyparts[slot], "id", "errorbad")
		var bodypart = GlobalRegistry.createBodypart(id)
		if(bodypart == null):
			var replacementID = BodypartSlot.findReplacement(slot, id)
			if(replacementID == null || replacementID == ""):
				Log.printerr("Couldn't find an replacement bodypart for slot "+str(slot))
				continue
			bodypart = GlobalRegistry.createBodypart(replacementID)
			
		bodypart.loadData(SAVE.loadVar(loadedBodyparts[slot], "data", {}))
		giveBodypart(bodypart, false)
	
	loadStatusEffectsData(SAVE.loadVar(data, "statusEffects", {}))
	inventory.loadDataNPC(SAVE.loadVar(data, "inventory", {}))
	lustInterests.loadData(SAVE.loadVar(data, "lustInterests", {}))

	if(menstrualCycle != null && data.has("menstrualCycle")):
		menstrualCycle.loadData(SAVE.loadVar(data, "menstrualCycle", {}))

	timedBuffs = loadBuffsData(SAVE.loadVar(data, "timedBuffs", []))
	timedBuffsDurationSeconds = SAVE.loadVar(data, "timedBuffsDurationSeconds", 0)
	timedBuffsTurns = loadBuffsData(SAVE.loadVar(data, "timedBuffsTurns", []))
	timedBuffsDurationTurns = SAVE.loadVar(data, "timedBuffsDurationTurns", 0)
	
	lastUpdatedDay = SAVE.loadVar(data, "lastUpdatedDay", -1)
	lastUpdatedSecond = SAVE.loadVar(data, "lastUpdatedSecond", -1)
