extends Module
class_name RahiModule

func getFlags():
	return {
		# Rahi module
		"Rahi_Introduced": flag(FlagType.Bool),
		"Rahi_AskedName": flag(FlagType.Bool),
		"Rahi_GaveApple": flag(FlagType.Bool),
		"Rahi_CanteenSceneHappened": flag(FlagType.Bool),
		"Avy_WonCanteenFight": flag(FlagType.Bool),
		"Rahi_ChillWillHappen": flag(FlagType.Bool),
		"Rahi_ChillHappened": flag(FlagType.Bool),
		"Rahi_ChillCooldown": flag(FlagType.Number),
		"Rahi_Denied": flag(FlagType.Bool),
		"Rahi_ShowerHappened": flag(FlagType.Bool),
		"Rahi_NotThereToday": flag(FlagType.Bool),
		"Rahi_FirstTimePregnantHappened": flag(FlagType.Bool),
		"Rahi_GaveBirthTimes": flag(FlagType.Number),
		
		"rahi1ElizaSceneHappened": flag(FlagType.Bool),
		"rahi1ProtectedRahi": flag(FlagType.Bool),
		"rahi2SceneHappened": flag(FlagType.Bool),
		"rahi2Denied": flag(FlagType.Bool),
		"rahi2SpilledBottle": flag(FlagType.Bool),
		"rahi2KissedRahi": flag(FlagType.Bool),
		"rahi2WonGuard": flag(FlagType.Bool),
		"rahi3SceneHappened": flag(FlagType.Bool),
		"rahi3DayHappened": flag(FlagType.Number),
		"rahi4SceneHappened": flag(FlagType.Bool),
		"rahi4DayHappened": flag(FlagType.Number),
		"rahi4SaidFix": flag(FlagType.Bool),
		"rahi5SceneHappened": flag(FlagType.Bool),
		
		"rahiMile2Embraced": flag(FlagType.Bool),
		"rahiMile4WasKind": flag(FlagType.Bool),
		"rahiMile5Intervened": flag(FlagType.Bool),
		"rahiMile6ToldBroke": flag(FlagType.Bool),
		
		"rahiSlaveryDidTaskToday": flag(FlagType.Bool),
		"rahiPCName": flag(FlagType.Text),
		"rahiSlaveryStage": flag(FlagType.Number),
		
		# Mood stuff (can go up and down)
		"rahiObedience": flag(FlagType.Number), # raised by d/s actions/choices
		"rahiAffection": flag(FlagType.Number), # raised by love actions
		#"rahiAddiction": flag(FlagType.Number), # lowers if you deny Rahi from drinking
		"rahiTired": flag(FlagType.Number), # If tired = must let her sleep
		
		"rahiNeedsPunishment": flag(FlagType.Bool),
		"rahiNeedsReward": flag(FlagType.Bool),
		"rahiTaskSuceeded": flag(FlagType.Bool),
		"rahiCommentedOnTask": flag(FlagType.Bool),
		# unspent points will go to unfair or spoiled scores
		
		"rahiPickedSkills": flag(FlagType.Dict), # picked skills might add tasks
		"rahiTalkedTopics": flag(FlagType.Dict),
		
		# Base skills
		"rahiSkillLabor": flag(FlagType.Number),
		# Optional skills
		"rahiSkillSex": flag(FlagType.Number),
		"rahiSkillAnal": flag(FlagType.Number),
		"rahiSkillMasochist": flag(FlagType.Number),
		"rahiSkillExhibit": flag(FlagType.Number),
		"rahiSkillPetplay": flag(FlagType.Number),
		"rahiSkillDominance": flag(FlagType.Number),
		"rahiSkillProstitution": flag(FlagType.Number),
		"rahiSkillWatersports": flag(FlagType.Number),	
	}

func _init():
	id = "RahiModule"
	author = "Rahi"
	
	scenes = [
		"res://Modules/RahiModule/RahiTalkScene.gd",
		"res://Modules/RahiModule/RahiAvyCanteenScene.gd",
		"res://Modules/RahiModule/RahiChillScene.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerScene.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantScene.gd",
		"res://Modules/RahiModule/RahiEmbraceScene.gd",
		
		"res://Modules/RahiModule/1PreSlavery/rahi1ElizaScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi2RahiScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi3RahiPassOutScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi4BreakdownScene.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi5SlaveryStartScene.gd",
		
		"res://Modules/RahiModule/2Slavery/rahiSlaveryMorningScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryPickTaskScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkAnythingScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiTaskCommentingScene.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaverySkillLearnScene.gd",
		"res://Modules/RahiModule/2Slavery/Tasks/rahiSlaveryCleaningTaskScene.gd",
		"res://Modules/RahiModule/2Slavery/Rewards/rahiRewardPetScene.gd",
		"res://Modules/RahiModule/2Slavery/Punishments/rahiPunishmentTyingUpScene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone1Scene.gd",
		"res://Modules/RahiModule/2Slavery/Tasks/rahiSlaveryStealingTaskScene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone2Scene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone3Scene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone4Scene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone5Scene.gd",
		"res://Modules/RahiModule/2Slavery/Milestones/rahiMilestone6Scene.gd",
		]
	characters = [
		"res://Modules/RahiModule/RahiCharacter.gd",
		"res://Modules/RahiModule/AvyCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/MineOwnerCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/PharmacistCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/RabiCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/SamirCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/AlphaCorpLadyCharacter.gd",
		"res://Modules/RahiModule/2Slavery/FlashbackCharacters/BarGuyCharacter.gd",
	]
	items = []
	events = [
		"res://Modules/RahiModule/RahiTalkEvent.gd",
		"res://Modules/RahiModule/RahiAvyCanteenEvent.gd",
		"res://Modules/RahiModule/RahiChillEvent.gd",
		
		"res://Modules/RahiModule/ShowerEvent/RahiShowerEvent.gd",
		
		"res://Modules/RahiModule/RahiFirstTimePregnantEvent.gd",
		
		"res://Modules/RahiModule/1PreSlavery/rahi1ElizaEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi2RahiEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi3RahiPassOutEvent.gd",
		"res://Modules/RahiModule/1PreSlavery/rahi4BreakdownEvent.gd",
		"res://Modules/RahiModule/2Slavery/rahiSlaveryTalkEvent.gd",
	]
	quests = [
		"res://Modules/RahiModule/RahiSlaveryQuest.gd",
	]

func resetFlagsOnNewDay():
	if(getFlag("RahiModule.rahiSlaveryDidTaskToday", false)):
		setFlag("RahiModule.rahiSlaveryDidTaskToday", false)
	if(getFlag("RahiModule.rahiTired", 0) != 0):
		setFlag("RahiModule.rahiTired", 0)
	
	if(getFlag("RahiModule.rahiNeedsPunishment", false)):
		setFlag("RahiModule.rahiNeedsPunishment", false)
	if(getFlag("RahiModule.rahiNeedsReward", false)):
		setFlag("RahiModule.rahiNeedsReward", false)
	
	if(GM.main.getModuleFlag("RahiModule", "Rahi_NotThereToday", false)):
		GM.main.setModuleFlag("RahiModule", "Rahi_NotThereToday", false)
	
	# Chill near waterfall event stuff
	if(!GM.main.getModuleFlag("RahiModule", "Rahi_ChillHappened", false) && !GM.main.getModuleFlag("RahiModule", "Rahi_Denied", false)):
		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) > 0):
			GM.main.increaseModuleFlag("RahiModule", "Rahi_ChillCooldown", -1)

		if(GM.main.getModuleFlag("RahiModule", "Rahi_ChillCooldown", 0) == 0 && GM.main.getModuleFlag("RahiModule", "Rahi_GaveApple", false)):
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", true)
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillCooldown", RNG.randi_range(1, 3))
		else:
			GM.main.setModuleFlag("RahiModule", "Rahi_ChillWillHappen", false)

static func trustsPC():
	return GM.main.getModuleFlag("RahiModule", "Rahi_ShowerHappened", false)

func canAdvanceStage():
	var currentStage = getFlag("RahiModule.rahiSlaveryStage", 0)
	
	if(currentStage >= getMaxStage()):
		return false
		
	var statLimit = getStatLimit()
	if(getFlag("RahiModule.rahiObedience", 0) < statLimit && getFlag("RahiModule.rahiAffection", 0) < statLimit):
		return false
		
	return true

func getStatLimit():
	var currentStage = getFlag("RahiModule.rahiSlaveryStage", 0)
	
	if(currentStage == 0):
		return 10
	if(currentStage == 1):
		return 20
	if(currentStage == 2):
		return 30
	if(currentStage == 3):
		return 40
	if(currentStage == 4):
		return 50
	if(currentStage == 5):
		return 60
	
	return 999

func getMaxStage():
	return 6

func getAdvanceStageScene():
	var currentStage = getFlag("RahiModule.rahiSlaveryStage", 0)
	if(currentStage == 0):
		return "rahiMilestone1Scene"
	if(currentStage == 1):
		return "rahiMilestone2Scene"
	if(currentStage == 2):
		return "rahiMilestone3Scene"
	if(currentStage == 3):
		return "rahiMilestone4Scene"
	if(currentStage == 4):
		return "rahiMilestone5Scene"
	if(currentStage == 5):
		return "rahiMilestone6Scene"
	
	return null

func getSkillsInfo():
	return {
		"rahiSkillLabor": {
			"name": "Labor",
			"desc": "How well Rahi can do tedious tasks",
			"defaultSkill": true,
		},
		"rahiSkillSex": {
			"name": "Sex",
			"desc": "Allows you to train Rahi to do more types of sexual-activities rather than just boring vanilla sex",
		},
		"rahiSkillAnal": {
			"name": "Anal",
			"desc": "Allows you to train Rahi the secrets of anal sex",
		},
		"rahiSkillMasochist": {
			"name": "Masochism",
			"desc": "Allows you to turn Rahi into a painslut",
		},
		"rahiSkillExhibit": {
			"name": "Exhibitionism",
			"desc": "Allows you to teach Rahi to feel more confident while being nude in public",
		},
		"rahiSkillPetplay": {
			"name": "Petplay",
			"desc": "Allows you to train Rahi into a cute kitty pet",
		},
		"rahiSkillDominance": {
			"name": "Dominance",
			"desc": "Allows you to train Rahi into a domme",
		},
		"rahiSkillProstitution": {
			"name": "Prostitution",
			"desc": "Allows you to share Rahi with others, making her into a slut",
		},
		"rahiSkillWatersports": {
			"name": "Watersports",
			"desc": "Allows you to turn Rahi into a piss-slut",
			"requiredContent": [ContentType.Watersports],
		}
	}

func getSlaveryStage():
	return getFlag("RahiModule.rahiSlaveryStage", 0)

func getAffection():
	return getFlag("RahiModule.rahiAffection", 0)

func getObedience():
	return getFlag("RahiModule.rahiObedience", 0)

func getFreeSkillPoints():
	var pickedSkills = getFlag("RahiModule.rahiPickedSkills", {})
	var skillsInfo:Dictionary = getSkillsInfo()
	var currentStage = getFlag("RahiModule.rahiSlaveryStage", 0)
	
	var actualLearnedSkillNum = 0
	for skillID in skillsInfo:
		if(!pickedSkills.has(skillID)):
			continue
		
		if(skillsInfo[skillID].has("defaultSkill") && skillsInfo[skillID]["defaultSkill"]):
			continue
		
		actualLearnedSkillNum += 1
	
	var result = Util.maxi(0, currentStage - actualLearnedSkillNum)
	return result

func canLearnNewSkill():
	if(getFreeSkillPoints() <= 0):
		return false
	
	var skillsInfo:Dictionary = getSkillsInfo()
	var pickedSkills = getFlag("RahiModule.rahiPickedSkills", {})
	
	for skillID in skillsInfo:
		if(pickedSkills.has(skillID)):
			continue
		if(skillsInfo[skillID].has("defaultSkill") && skillsInfo[skillID]["defaultSkill"]):
			continue
		if(skillsInfo[skillID].has("requiredContent")):
			var hasBadContent = false
			for thecontent in skillsInfo[skillID]["requiredContent"]:
				if(!OPTIONS.isContentEnabled(thecontent)):
					hasBadContent = true
			if(hasBadContent):
				continue
		
		return true
	return false

func isSkillLearned(skillID):
	var pickedSkills = getFlag("RahiModule.rahiPickedSkills", {})
	var skillsInfo:Dictionary = getSkillsInfo()
	
	if(!skillsInfo.has(skillID)):
		return false
	
	if(skillsInfo[skillID].has("defaultSkill") && skillsInfo[skillID]["defaultSkill"]):
		return true
	
	return pickedSkills.has(skillID)
	
# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getSkillScore(skillID):
	return Util.mini(Util.maxi(int(getFlag("RahiModule."+str(skillID), 0)), 0), 15)

func getSkillSuccessChance(skillID, chanceWhenMinSkill, chanceWhenMaxSkill):
	var score = float(getSkillScore(skillID))
	
	return chanceWhenMinSkill + (chanceWhenMaxSkill - chanceWhenMinSkill) * (score / 15.0)

func getSlaveryStageChance(minstage, maxstage, minchance, maxchance):
	var currentStage = getSlaveryStage()
	
	if(currentStage <= minstage):
		return minchance
	if(currentStage >= maxstage):
		return maxchance
	
	var stageProgress = (currentStage - minstage) / (maxstage - minstage)
	
	return minchance + stageProgress * (maxchance - minchance)

func learnSkill(skillID):
	var skillsInfo:Dictionary = getSkillsInfo()
	
	if(!skillsInfo.has(skillID)):
		return false
	
	if(skillsInfo[skillID].has("defaultSkill") && skillsInfo[skillID]["defaultSkill"]):
		return false
	
	var pickedSkills = getFlag("RahiModule.rahiPickedSkills", {})
	if(pickedSkills.has(skillID)):
		return false
	pickedSkills[skillID] = true
	setFlag("RahiModule.rahiPickedSkills", pickedSkills)
	return true

func advanceSkill(skillID, maxLevel = 15):
	if(!isSkillLearned(skillID)):
		return false
	
	if(getFlag("RahiModule."+str(skillID), 0) < maxLevel):
		increaseFlag("RahiModule."+str(skillID), 1)
	return true

func getSkillScoreText(skillID):
	var score = getSkillScore(skillID)
	score = Util.mini(Util.maxi(int(score), 0), 15)
	
	var scoreToText = ["F-", "F", "F+", "D-", "D", "D+", "C-", "C", "B-", "B", "A-", "A", "S-", "S", "S+", "S++"]
	
	return scoreToText[score]
