class UWindowExampleActor expands Mutator config(UWindowExampleActor);

var config bool bHasReadMessage;
var PlayerPawn PP;

function PostBeginPlay()
{
	Log("[---------------------------------------]");
	Log("[     UWindowExampleActor               ]");
	Log("[---------------------------------------]");

	if (!bHasReadMessage) {
		spawn(class'A_SpawnNotify');
	}

	Destroy();
}

defaultproperties
{
}