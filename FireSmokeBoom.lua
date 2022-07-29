workspace.Part1.Touched:Wait();

workspace.Part1.Smoke.Enabled = true;

wait(1)

workspace.Part1.Fire.Enabled = true;

wait(2)

workspace.Part1.Fire.Size = 4;

wait(1)

workspace.Part1.Fire.Size = 15;

wait(2)

expl = Instance.new("Explosion", workspace);
expl.BlastRadius = 10;
expl.ExplosionType = Enum.ExplosionType.NoCraters;
expl.Position = workspace.Part1.Position;
workspace.Part1:Destroy()
