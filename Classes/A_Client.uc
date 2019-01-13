	class A_client expands Mutator;

simulated function PostNetBeginPlay()
{
	ShowWindow();
}

simulated function ShowWindow() {

	local PlayerPawn pp;
	local WindowConsole c;
	local A_Window w;

	local float posX;
	local float posY;

	local float desiredWidth;
	local float desiredHeight;

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

	if ((!c.bCreatedRoot) || (c.Root == None))
	{
		c.CreateRootWindow(None);
	}

	c.bQuickKeyEnable=True;
	c.LaunchUWindow();

	desiredWidth  = 300;
	desiredHeight = 160;

	posX = (c.Root.WinWidth - desiredWidth) / 2;
	posY = (c.Root.WinHeight - desiredHeight) / 2;

	pp.Say("DEBUG from A_Client:");
	pp.Say("c.Root.WinWidth = " $ c.Root.WinWidth);
	pp.Say("c.Root.WinHeight = " $ c.Root.WinHeight);
	pp.Say("posX = " $ posX);
	pp.Say("posY = " $ posY);

	w = A_Window(c.Root.CreateWindow(Class'A_Window', posX, posY, desiredWidth, desiredHeight));
	w.ShowWindow();
}

defaultproperties
{
}
