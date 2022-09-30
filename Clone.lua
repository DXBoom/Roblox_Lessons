local object = workspace.CloneObject
local clonedObject = object:Clone()

clonedObject.Parent = workspace
clonedObject.Position = Vector3.new(15, 0, 15)
clonedObject.Name = "ClonePart"
