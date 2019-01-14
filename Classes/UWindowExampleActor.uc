class UWindowExampleActor expands Mutator config(UWindowExampleActor);

var config bool bHasReadMessage;
var PlayerPawn PP;

replication {
	reliable if(Role < ROLE_Authority)
		bHasReadMessage;
}

function PostBeginPlay()
{
	Log("[---------------------------------------]");
	Log("[     UWindowExampleActor               ]");
	Log("[---------------------------------------]");
	Log(bHasReadMessage);

	if (!bHasReadMessage)
		spawn(class'A_SpawnNotify');

	Destroy();
}

simulated function MarkAsRead() {

	bHasReadMessage = True;

	PP = PlayerPawn(Owner);
	PP.Say("DEBUG from MarkAsRead:");
	PP.Say("bHasReadMessage: " $ string(bHasReadMessage));

	SaveConfig();

}

defaultproperties
{
	bHasReadMessage=False
}