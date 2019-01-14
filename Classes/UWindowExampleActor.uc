class UWindowExampleActor expands Mutator config(UWindowExampleActor);

var config bool bHasReadMessage;
var PlayerPawn PP;

replication {
	reliable if(Role < ROLE_Authority)
		bHasReadMessage;
}

function PostBeginPlay()
{

	// Super.PostBeginPlay();

	Log("[---------------------------------------]");
	Log("[     UWindowExampleActor               ]");
	Log("[---------------------------------------]");

	spawn(class'A_SpawnNotify');

	Destroy();

}

simulated function bool getHasReadMessage() {
	Log("DEBUG: UWindowExampleActor->getHasReadMessage()");
	return bHasReadMessage;
}

simulated function MarkAsRead() {

	Log("DEBUG: UWindowExampleActor->MarkAsRead()");

	bHasReadMessage = True;

	PP = PlayerPawn(Owner);
	PP.Say("DEBUG from UWindowExampleActor MarkAsRead())");
	PP.Say("bHasReadMessage: " $ string(bHasReadMessage));

	SaveConfig();

}

defaultproperties
{
	bHasReadMessage=False
}