class UWindowExampleActor expands Mutator config(UWindowExampleActor);

function PostBeginPlay()
{
	Log("[---------------------------------------]");
	Log("[     UWindowExampleActor               ]");
	Log("[---------------------------------------]");

	spawn(class'A_SpawnNotify');

	Destroy();
}

defaultproperties
{
}