class A_SpawnNotify expands SpawnNotify;

var A_client AC;

simulated function PreBeginPlay()
{
	bAlwaysRelevant = True;
}

simulated event Actor SpawnNotification(Actor A)
{	
	if(A.IsA('PlayerPawn')) {
		spawn(class'A_client',A);
	}
	return A;
}

defaultproperties
{
}
