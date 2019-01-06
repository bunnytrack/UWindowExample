class A_Window expands UWindowFramedWindow;

function Created()
{
	Super.Created();
	SetSize(500, 250);
	Log(Root.WinWidth);
	Log(Root.WinHeight);
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
    WindowTitle="My New Window Title!"
    bStatusBar=True
    bLeaveOnscreen=True
}
