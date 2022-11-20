extends Bodypart
class_name BodypartPenis

var lengthCM = 15
var ballsScale: float = 1.0

func _init():
	limbSlot = LimbTypes.Penis
	fluidProduction = CumProduction.new()
	fluidProduction.bodypart = weakref(self)
	needsProcessing = true

func getSlot():
	return BodypartSlot.Penis

func getTooltipInfo():
	var text = "length: " + Util.cmToString(lengthCM) + "\n"
	text += BodilyFluids.FluidType.getName(getFluidProduction().getFluidType())+": " + str(round(getFluidProduction().getFluidAmount() * 10.0)/10.0)+"/"+ str(round(getFluidProduction().getCapacity() * 10.0)/10.0)+" ml"
	return text

func saveData():
	var data = .saveData()
	data["lengthCM"] = lengthCM
	data["ballsScale"] = ballsScale
	
	return data

func loadData(_data):
	lengthCM = SAVE.loadVar(_data, "lengthCM", 15)
	ballsScale = SAVE.loadVar(_data, "ballsScale", 1.0)
	
	.loadData(_data)

func getLewdSizeAdjective():
	if(lengthCM <= 5.0):
		return RNG.pick(["tiny", "minuscule"])
	if(lengthCM <= 9.0):
		return RNG.pick(["small", "little", "short"])
	if(lengthCM <= 14.0):
		return RNG.pick(["average", "average-sized", "fair-sized"])
	if(lengthCM <= 21.0):
		return RNG.pick(["impressive", "lengthy", "large"])
	if(lengthCM <= 31.0):
		return RNG.pick(["massive", "enormous", "giant"])
	if(lengthCM <= 51.0):
		return RNG.pick(["hyper-sized", "monstrous", "colossal", "massive"])
	
	return RNG.pick(["hyper-sized", "gigantic", "monumental", "colossal", "massive"])

func getLewdAdjective():
	return RNG.pick(["human"])
	
func getLewdName():
	return RNG.pick(["cock", "cock", "dick", "dick", "member", "shaft"])

func getPickableAttributes():
	return {
		"cocksize": {
			"text": "Pick your cock's length",
			"textButton": "Length",
			"buttonDesc": "Pick the cock's length",
			"options": [
				[5, Util.cmToString(5), "Pick this length"],
				[8, Util.cmToString(8), "Pick this length"],
				[10, Util.cmToString(10), "Pick this length"],
				[13, Util.cmToString(13), "Pick this length"],
				[15, Util.cmToString(15), "Pick this length"],
				[18, Util.cmToString(18), "Pick this length"],
				[22, Util.cmToString(22), "Pick this length"],
				[25, Util.cmToString(25), "Pick this length"],
				[30, Util.cmToString(30), "Pick this length"],
				[40, Util.cmToString(40), "Pick this length"],
				[50, Util.cmToString(50), "Pick this length"],
			]
		},
		"ballsscale": {
			"text": "Pick your balls scale",
			"textButton": "Balls",
			"buttonDesc": "Pick the cock's balls scale",
			"options": [
				[0.0, "0%", "Pick this scale"],
				[0.3, "20%", "Pick this scale"],
				[0.5, "50%", "Pick this scale"],
				[0.8, "80%", "Pick this scale"],
				[1.0, "100%", "Pick this scale"],
				[1.2, "120%", "Pick this scale"],
				[1.5, "150%", "Pick this scale"],
				[1.8, "180%", "Pick this scale"],
				[2.0, "200%", "Pick this scale"],
				[2.5, "250%", "Pick this scale"],
				[3.0, "300%", "Pick this scale"],
				[4.0, "400%", "Pick this scale"],
				[5.0, "500%", "Pick this scale"],
			]
		}
	}
	
func applyAttribute(_attrID: String, _attrValue):
	if(_attrID == "cocksize"):
		lengthCM = _attrValue
	if(_attrID == "ballsscale"):
		ballsScale = _attrValue

func getAttributesText():
	return [
		["Penis length", Util.cmToString(lengthCM)],
		["Balls scale", str(Util.roundF(ballsScale*100.0, 1))+"%"],
	]
	
func getCharCreatorData():
	return [
		["lengthCM", lengthCM],
		["ballsScale", ballsScale],
	]

func getLength():
	return lengthCM

func safeWhenExposed():
	return false

func getPenisScale():
	return max(0.5 + (lengthCM - 5.0) / 26.0, 0.5)

func getBallsScale():
	return ballsScale

func getRevealMessage():
	return Util.capitalizeFirstLetter(getLewdDescriptionAndName()) + " got revealed."

func generateDataFor(_dynamicCharacter):
	lengthCM = RNG.randf_range(10.0, 25.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(5.0, 10.0)
	if(RNG.chance(5)):
		lengthCM = RNG.randf_range(25.0, 30.0)
	lengthCM = Util.roundF(lengthCM, 1)
