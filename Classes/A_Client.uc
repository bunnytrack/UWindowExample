class A_client expands Mutator;

simulated function PostNetBeginPlay()
{
	ShowWindow();
}

simulated function ShowWindow() {

	local PlayerPawn pp;
	local WindowConsole c;
	local A_Window w;

	pp=PlayerPawn(Owner);

	if (pp==None )
	{
		return;
	}

	c = WindowConsole(pp.Player.Console);

	if (c==None )
	{
		return;
	}

	if ( (!c.bCreatedRoot)||(c.Root == None))
	{
		c.CreateRootWindow(None);
	}

	c.bQuickKeyEnable=True;
	c.LaunchUWindow();

	w = A_Window(c.Root.CreateWindow(Class'A_Window', 100, 100, 300, 190));
	w.ShowWindow();
}

defaultproperties
{
}
