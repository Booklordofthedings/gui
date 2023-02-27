namespace gui;
using System;
using System.Collections;
using raylib_beef;
using LybLog;
class App
{
    //Singleton
    private static App instance ~ delete _;
    public static App Instance
    {
        get
        {
            if (instance == null)
            {
                instance = new App();
            }
            return instance;
        }
    }

    private Engine engine = new .() ~ delete _;
    public Screen CurrentScreen ~ delete _;
    public void Run(Screen pStartingScreen)
    {
        Log.Info("Starting App");
        engine.Startup();
        CurrentScreen = pStartingScreen;

        //Main Loop
        while(!Raylib.WindowShouldClose())
        {
            Raylib.BeginDrawing();
            Raylib.ClearBackground(.WHITE);
			Raylib.EndDrawing();
        }
		Raylib.CloseWindow();
        Log.Info("Closing App");
    }
}