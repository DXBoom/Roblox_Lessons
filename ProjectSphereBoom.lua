script.Parent.Anchored = true
wait(10)
script.Parent.Anchored = false

script.parent.Touched:Wait();

expl = Instance.new("Explosion", workspace);

expl.BlastRadius = 30;
expl.ExplosionType = Enum.ExplosionType.CratersAndDebris;
expl.Position = script.parent.Position;

script.parent.Transparency = 1.0;
