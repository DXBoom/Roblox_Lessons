script.parent.Touched:Wait();
wait(1);

expl = Instance.new("Explosion", workspace);

expl.BlastRadius = 20;
expl.ExplosionType = Enum.ExplosionType.NoCraters;
expl.Position = script.parent.Position;

script.parent.Transparency = 1.0;
