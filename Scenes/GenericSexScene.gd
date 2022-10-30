extends "res://Scenes/SceneBase.gd"

var sexEngine:SexEngine
var currentCategory = []
#var whatHappened = "ASD"

func _init():
	sceneID = "GenericSexScene"

func _initScene(_args = []):
	sexEngine = SexEngine.new()
	
	var top = _args[0]
	
	sexEngine.initPeople(top, "pc")
	#sexEngine.initPeople(top, "rahi")
	
	#sexEngine.initPeople("pc", top)
	#sexEngine.initPeople(top, "pc")
	#sexEngine.initPeople(top, "rahi")
	sexEngine.generateGoals()
	
	sexEngine.start()


func _run():
	if(state == ""):
		saynn("Nya")
		
		if(currentCategory != []):
			addButton("Back", "Back to the previous menu", "backbutton")
		
		#saynn(whatHappened)
		saynn(sexEngine.getFinalText())
		
		for domID in sexEngine.getDomIDs():
			var domInfo: SexDomInfo = sexEngine.getDomInfo(domID)
			sayn(domInfo.getInfoString())
		for subID in sexEngine.getSubIDs():
			var subInfo: SexSubInfo = sexEngine.getSubInfo(subID)
			sayn(subInfo.getInfoString())
		
		var categoryButtons = {}
		for actionInfo in sexEngine.getActions():
			var actionCategory = []
			if("category" in actionInfo):
				actionCategory = actionInfo["category"]
				
			if(currentCategory.size() >= actionCategory.size()):
				continue
			
			var good = true
			for _i in range(0, currentCategory.size()):
				if(currentCategory[_i] != actionCategory[_i]):
					good = false
					break
			
			if(!good):
				continue
			
			var newCategory = actionCategory[currentCategory.size()]
			if(!categoryButtons.has(newCategory)):
				categoryButtons[newCategory] = true
				addButton("!"+newCategory, "Look at the actions in this category", "pickcategory", [newCategory])
		
		for actionInfo in sexEngine.getActions():
			var actionCategory = []
			if("category" in actionInfo):
				actionCategory = actionInfo["category"]
			
			if(currentCategory == actionCategory):
				addButton(actionInfo["name"], "ASD", "doAction", [actionInfo])
		
		#addButton("Process", "Process", "processTurn")
		
		addButton("Close", "Close the scene", "endthescene")


func _react(_action: String, _args):
	if(_action == "doAction"):
		currentCategory = []
		sexEngine.doAction(_args[0])
		setState("")
		return
	
	if(_action == "backbutton"):
		currentCategory.pop_back()
		return
	
	if(_action == "pickcategory"):
		currentCategory.append(_args[0])
		return
	
#	if(_action == "processTurn"):
#		var turnInfo = sexEngine.processTurn()
#		whatHappened = turnInfo["text"]
#		setState("")
#		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
