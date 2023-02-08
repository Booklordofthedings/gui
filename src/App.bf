namespace sui;
using raylib_beef;
using LybLog;
using System;
class App
{
	public this()
	{
		Raylib.SetTraceLogLevel(.LOG_NONE);
		Raylib.SetTargetFPS(60);
		Log.Settings.LogLevel = .Debug;
		Log.Settings.DoFileLog = true;
		Log.Settings.LogFilePath = ".log";
		Log.Info("sui - Started running");
	}
	public ~this()
	{
		Log.Info("sui - Closing ...");
	}

	public uint16[2] BaseWindowSize = .(1280, 720);
	public String BaseWindowName = "sui - window";

	//Executes the beef app
	public void Run()
	{
		Raylib.InitWindow((.)BaseWindowSize[0], (.)BaseWindowSize[1], BaseWindowName);
		Raylib.SetExitKey(.KEY_END);
		while(!Raylib.WindowShouldClose())
		{
			Raylib.BeginDrawing();
			Raylib.ClearBackground(.RAYWHITE);
			Raylib.EndDrawing();
		}
		Raylib.CloseWindow();
	}
}