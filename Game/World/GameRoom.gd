extends Sprite
class_name GameRoom

export(String) var roomName = ""
export(String) var roomID = ""
export(String, MULTILINE) var roomDescription = ""

export(bool) var canWest = true
export(bool) var canNorth = true
export(bool) var canEast = true
export(bool) var canSouth = true

enum RoomSprite { NONE, PERSON, CANTEEN, STAIRS }
export(RoomSprite) var roomSprite = RoomSprite.NONE

var world: GameWorld
var gridsize = 64

var sprites = {
	#RoomSprite.NONE: ,
	RoomSprite.PERSON: preload("res://Game/World/sprites/person.png"),
	RoomSprite.CANTEEN: preload("res://Game/World/sprites/canteen.png"),
	RoomSprite.STAIRS: preload("res://Game/World/sprites/stairs.png"),
}
onready var roomSpriteObject = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!roomID):
		roomID = name
	if(!roomName):
		roomName = roomID
	
	if(get_parent() is GameWorld):
		world = get_parent()
		gridsize = world.gridsize
	if(get_parent() is SubGameWorld):
		world = get_parent().get_parent()
		gridsize = world.gridsize
	
	global_position.x = round(global_position.x / gridsize) * gridsize
	global_position.y = round(global_position.y / gridsize) * gridsize
	
	if(world):
		world.registerRoom(self)
		
	if(sprites.has(roomSprite)):
		roomSpriteObject.texture = sprites[roomSprite]
	
func getCell():
	return Vector2(round(global_position.x / gridsize), round(global_position.y / gridsize))

func getDescription() -> String:
	return _getDescription()

func _getDescription() -> String:
	return roomDescription

func getName():
	return roomName

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func addButton(text: String, tooltip: String = "", arg: String = ""):
	GM.ui.addButton(text, tooltip, "roomCallback", [roomID, arg])
	#emit_signal("addButton", text, method, tooltip)
	
func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)
	#emit_signal("addDisabledButton", text, tooltip)
	
func clearScreen():
	GM.ui.clearText()
	GM.ui.clearButtons()
	
func runScene(id: String, args = []):
	GM.main.runScene(id, args)

func addActions():
	for action in get_children():
		if(action is RoomAction):
			var roomAction:RoomAction = action
			if(roomAction._shouldShow()):
				if(roomAction._canRun()):
					GM.ui.addButton(roomAction.ActionName, roomAction.ActionTooltip, "actionCallback", [roomAction.ActionScene])
				else:
					GM.ui.addDisabledButton(roomAction.ActionName, roomAction.ActionTooltip)
func _onEnter():
	say(getDescription())
	addActions()

func _onButton(key):
	print("Error: non-scripted room got button callback with key " + key)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass