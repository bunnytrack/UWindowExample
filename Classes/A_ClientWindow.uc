class A_ClientWindow expands UMenuDialogClientWindow;

var UWindowMessageBoxArea MessageArea;
var UWindowCheckBox       CheckBox;
var UWindowSmallButton    CloseButton;

var UWindowExampleActor UWin;

function Created() {

	Super.Created();

	WinLeft = Root.WinWidth/2 - WinWidth/2;
	WinTop = Root.WinHeight/2 - WinHeight/2;

	MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 20, 20, 260, 48));
	MessageArea.Message="Please note that the map list on this server has been reduced to a selection of high-quality maps only.";

	MessageArea = UWindowMessageBoxArea(CreateWindow(class'UWindowMessageBoxArea', 20, 50, 260, 32));
	MessageArea.Message="You can still play our complete selection of BT maps on Server 2 by saying '!go 2'.";

	CheckBox = UWindowCheckBox(CreateControl(class'UWindowCheckBox', 20, 82, 220, 16));
	CheckBox.SetText("Tick this box to not show this message again");
	CheckBox.SetFont(F_Normal);
	CheckBox.Align = TA_Right;
	// CheckBox.SetSize(260, 1);

	CloseButton = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 20, 105, 100, 20));
	CloseButton.DownSound = sound 'UnrealShare.WeaponPickup';
	CloseButton.Text= "Accept and Close";

	SetAcceptsFocus();

}

simulated function MarkAsRead() {

	GetPlayerOwner().Say("DEBUG FROM A_ClientWindow MarkAsRead()");

	UWin.MarkAsRead();

}

simulated static function bool HasReadMessage() {
	return UWin.bHasReadMessage;
}

function Notify(UWindowDialogControl C, byte E) {

	local bool bRead;

	bRead = HasReadMessage();

	Super.Notify(C, E);

	switch(E) {

		case DE_Click:
			 switch(C) {
				case CloseButton:
					GetPlayerOwner().Say("DEBUG from A_ClientWindow:");
					GetPlayerOwner().Say("UWin.bHasReadMessage: " $ string(bRead));
					GetPlayerOwner().Say("CheckBox.bChecked: " $ string(CheckBox.bChecked));

					if (CheckBox.bChecked) {
						MarkAsRead();
					}

					ParentWindow.ParentWindow.Close();
				break;
			}
		break;

	}

}


defaultproperties
{
}
