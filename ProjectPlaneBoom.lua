wait(11)

workspace.Part3.Smoke.Enabled = true;

wait(1)

workspace.Part3.Fire.Enabled = true;

workspace.Part3.Fire.Size = 30;

wait(2)

expl = Instance.new("Explosion", workspace);
expl.BlastRadius = 10;
expl.ExplosionType = Enum.ExplosionType.NoCraters;
expl.Position = workspace.Part3.Position;
workspace.Part3:Destroy()
