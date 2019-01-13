class A_Window expands UWindowFramedWindow;

function Created()
{
	Super.Created();
	// SetSize(200, 150); // Unnecessary?
	
	GetPlayerOwner().Say("Root.WinWidth = " $ Root.WinWidth);
	GetPlayerOwner().Say("Root.WinHeight = " $ Root.WinHeight);
	GetPlayerOwner().Say(WinWidth $ " x " $ WinHeight);

	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop  = (Root.WinHeight - WinHeight) / 2;
}

function Close (optional bool bByParent)
{
	Super.Close(bByParent);
	WindowConsole(GetPlayerOwner().Player.Console).CloseUWindow();
}

defaultproperties
{
    ClientClass=Class'A_ClientWindow'
    WindowTitle="BunnyTrack.net Notice"
    bStatusBar=False
    bLeaveOnscreen=True
}
