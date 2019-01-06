class A_ClientWindow expands UMenuDialogClientWindow;

var UWindowMessageBoxArea MessageArea;

function Created () {

	Super.Created();

	WinLeft = Root.WinWidth/2 - WinWidth/2;
	WinTop = Root.WinHeight/2 - WinHeight/2;

	MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 20, 20, 400, 42));
	MessageArea.Message="Hey check out my sweet new window!";

	MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 20, 80, 400, 16));
	MessageArea.Message="It's amazingly 1337!";

	MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 20, 120, 400, 36));
	MessageArea.Message="Yeah go 1337-ness!";

	SetAcceptsFocus();
}

defaultproperties
{
}
