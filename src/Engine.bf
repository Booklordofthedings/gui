namespace gui;
using raylib_beef;
using raylib_beef.Types;
using BeefBrand;
using System;
using LybLog;
class Engine
{
    //Private initial window settings
    private int32 startingWidth = 1280;
    private int32 startingHeight = 720;
    private int32 startingPosX = 100;
    private int32 startingPosY = 100;
    private String startingTitle = "Gui Application";
    private Image startingIcon = Raylib.LoadImageFromMemory(".png", &BrandedAssets.DefaultImage, BrandedAssets.DefaultImage.Count) ~ Raylib.UnloadImage(_);

    public this() {}
    

    public void Startup()
    {
        //Configure logger
        Log.Settings.LogFilePath = ".log";
        Log.Settings.DoFileLog = true;
        Log.Settings.LogLevel = .Debug;

        //Start up Raylib
        Log.Info("Starting up Raylib");
        Raylib.SetConfigFlags(.FLAG_WINDOW_RESIZABLE | .FLAG_WINDOW_HIGHDPI | .FLAG_WINDOW_ALWAYS_RUN); //Set window flags
        Raylib.SetTraceLogLevel(.LOG_NONE); //Set log level to none
        Raylib.InitWindow(startingWidth, startingHeight, startingTitle); //Initialize window
        Raylib.SetWindowPosition(startingPosX, startingPosY); //Set window position
        Raylib.SetWindowIcon(startingIcon); //Set window icon
        Raylib.SetTargetFPS(60); //Set target FPS
        Raylib.SetExitKey(.KEY_END); //Set exit key
        Log.Info("Raylib started up successfully!");
    }

    private Image windowIcon;
    public Result<void> SetWindowIcon(ref uint8[] icon)
    {
        if (icon == null)
            return .Err;
        Raylib.UnloadImage(windowIcon);s
        windowIcon = Raylib.LoadImageFromMemory(".png", (.)&icon, (.)icon.Count);
        Raylib.SetWindowIcon(windowIcon);
        return .Ok;
    }

    private String windowTitle;
    public String WindowTitle
    {
        get { return windowTitle; }
        set
        {
            windowTitle = value;
            Raylib.SetWindowTitle(windowTitle);
        }
    }
}