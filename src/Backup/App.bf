namespace gui;
//Usings
using gui.Internal;

using raylib_beef;
using raylib_beef.Enums;
using raylib_beef.Types;

using LybLog;

using System;
using System.Collections;

class App
{
	//Singleton pattern
	//In order to clean you have to delete the result of this at the end
	private static App _App = null;
	public static App Get()
	{
		if(_App == null)
			_App = new .();
		return _App;
	}

#region Fields
	public WindowSettings Settings = new .() ~ delete _; //
	public List<Screen> Screens = new .() ~ DeleteContainerAndItems!(_);
	public RMenu R = new .() ~ delete _;
#endregion

#region ExternUsage
	//Executes the SUI app
	public void Run(Screen pStartingScreen)
	{
		Initialize(); //Initialize according to settings

		pStartingScreen.IsActive = true;
		Screens.Add(pStartingScreen);

		while(!Raylib.WindowShouldClose())
		{
			//Logic
			for(let e in Screens)
				if(e.IsActive)
					e.Update();

			for(let e in Screens)
				if(e.CurrentlySelected != null)
					e.CurrentlySelected.SelectedUpdate();

			

			//All rendering procedures go here
			Raylib.BeginDrawing();
			Raylib.ClearBackground(Theme.DefaultTheme().PrimaryBackground);

			//Normal draw
			for(let e in Screens)
				if(e.IsActive)
					e.Draw();

			//Late draw - Used for stuff like overlays that needs to be infront of something
			for(let e in Screens)
				if(e.IsActive)
					e.DrawLate();

			/* Handle the rightclick overlay
			R.Callbacks.Add(("Test", null));
			R.Callbacks.Add(("Test", null));
			R.Callbacks.Add(("Test", null));

			R.Draw();
			R.Callbacks.Clear();
			*/

			Raylib.EndDrawing();
		}
		Raylib.CloseWindow();
	}

#endregion

#region Internal
	private void Initialize()
	{
		Raylib.SetTraceLogLevel(.LOG_NONE); //Tell Raylib to shutup

		//Lyblogger settings + Initialization
		Log.Settings.LogLevel = .Debug;
		Log.Settings.DoFileLog = true;
		Log.Settings.LogFilePath = ".log";
		Log.Info("Initializing app");

		//Setup raylib
		Raylib.SetTargetFPS(Settings.TargetFps);

		//Calculate config flgas
		var cf = ConfigFlag.FLAG_WINDOW_ALWAYS_RUN | .FLAG_WINDOW_HIGHDPI;
		if(Settings.IsResizeable)
			cf = cf | .FLAG_WINDOW_RESIZABLE;
		Raylib.SetConfigFlags(cf);

		Raylib.InitWindow(
			(.)Settings.Position.Width,
			(.)Settings.Position.Height,
			Settings.WindowName );

		if(Settings.Position.Position.x != -1 && Settings.Position.Position.y != -1)
			Raylib.SetWindowPosition((.)Settings.Position.Position.x, (.)Settings.Position.Position.y);

		Raylib.SetWindowMinSize(
			Settings.MinSize[0],
			Settings.MinSize[1] );

		Raylib.SetExitKey(Settings.ExitKey);

		Raylib.SetWindowIcon(Settings.WindowIcon);
	}
#endregion

#region Api

#endregion
	public Result<Screen> TryGetSceneByName(StringView pName)
	{
		for(let e in Screens)
			if(e.Name == pName)
				return .Ok(e);
		return .Err;
	}

	public Result<void> AllActiveButOne(StringView pName)
	{
		for(let e in Screens)
		{
			if(e.Name == pName)
			{
				e.IsActive = true;
				for(let ee in  Screens)
					if(e.Name != pName)
						e.IsActive = false;
				return .Ok;
			}
		}
		return .Err;
	}



}