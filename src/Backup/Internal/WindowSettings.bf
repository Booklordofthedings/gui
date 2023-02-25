namespace gui.Internal;
//Usings
using raylib_beef;
using raylib_beef.Types;
using raylib_beef.Enums;

using System;

class WindowSettings
{ //Everything in here is to be used before initilization after that please use the official functions
	public String WindowName = "A SUI Program";
	public Rect Position = new .(-1,-1,1280,720) ~ delete _;
	public uint16[2] MinSize = .(640,360); 
	public uint16 TargetFps = 60;
	public bool IsResizeable = true;
	public KeyboardKey ExitKey = .KEY_END;
	private Image _WindowIcon = Raylib.LoadImageFromMemory(".png",&BrandedAssets.DefaultImage,548);
	public Image WindowIcon {
		public get {
			return _WindowIcon;
		}
		public set { //Fixing the memory leak like a good programmer
			Raylib.UnloadImage(_WindowIcon);
			_WindowIcon = value;
		}
	}
}