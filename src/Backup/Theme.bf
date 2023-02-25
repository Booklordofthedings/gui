namespace gui;
using raylib_beef.Types;
using gon_beef;
using System;
struct Theme
{
	public Color PrimaryBackground;
	public Color SecondaryBackground;
	public Color TertiaryBackground;

	public Color Primary;
	public Color Secondary;
	public Color Tertiary;

	public Color Success;
	public Color Info;
	public Color Warn;
	public Color Error;

	public Color Black;
	public Color White;
	public Color Gray;
	public Color Blue;
	public Color Red;
	public Color Green;
	public Color Yellow;
	public Color Orange;
	public Color Purple;
	public Color Pink;

	public static Theme DefaultTheme()
	{
		var toReturn = Theme();
		toReturn.PrimaryBackground = .(228,225,227,255);
		toReturn.SecondaryBackground = .(211,207,211,255);
		toReturn.TertiaryBackground = .(193,188,200,255);

		toReturn.Primary = .(26,24,39,255);
		toReturn.Secondary = .(53,51,70,255);
		toReturn.Tertiary = .(91,66,93,255);

		toReturn.Success = .(86,137,81,255);
		toReturn.Info = .(100,169,167,255);
		toReturn.Warn = .(211,192,75,255);
		toReturn.Error = .(160,45,45,255);

		toReturn.Black = .(26,24,39,255);
		toReturn.White = .(228,225,227,255);
		toReturn.Gray = .(193,188,200,255);
		toReturn.Blue = .(73,74,163,255);
		toReturn.Red = .(160,45,45,255);
		toReturn.Green = .(92,160,81,255);
		toReturn.Yellow = .(214,184,49,255);
		toReturn.Orange = .(180,84,52,255);
		toReturn.Purple = .(134,70,125,255);
		toReturn.Pink = .(198,57,129,255);

		return toReturn;
	}

	public static Theme DarkTheme()
	{
		var toReturn = Theme();
		toReturn.PrimaryBackground = .(53,51,70,255);
		toReturn.SecondaryBackground = .(42,40,57,255);
		toReturn.TertiaryBackground = .(24,23,37,255);

		toReturn.Primary = .(237,216,235,255);
		toReturn.Secondary = .(36,209,232,255);
		toReturn.Tertiary = .(231,183,234,255);

		toReturn.Success = .(148,218,162,255);
		toReturn.Info = .(148,214,218,255);
		toReturn.Warn = .(220,223,112,255);
		toReturn.Error = .(208,89,88,255);

		toReturn.Black = .(24,23,37,255);
		toReturn.White = .(237,216,235,255);
		toReturn.Gray = .(185,171,184,255);
		toReturn.Blue = .(143,157,214,255);
		toReturn.Red = .(208,89,88,255);
		toReturn.Green = .(148,218,162,255);
		toReturn.Yellow = .(220,223,112,255);
		toReturn.Orange = .(221,146,104,255);
		toReturn.Purple = .(208,131,228,255);
		toReturn.Pink = .(228,131,193,255);

		return toReturn;
	}

	public Theme FromGonString(String pValue)
	{
		Theme t = DefaultTheme();
		var gp = new GonParser();
		var g = new Gon();

		gp.Parse(g,pValue);
		//Meta checks
		GonEntry ThemeVersion;
		bool HasThemeVersion = g.TryGetMeta("v",out ThemeVersion);
		if(HasThemeVersion && ThemeVersion.Data.Integer > 1)
			LybLog.LybLog.Log.Warn("The theme version parser is outdated, some colors may not be mapped correctly");

		LybLog.LybLog.Log.Debug("TODO: Load theme");
		delete g;
		delete gp;
		return t;
	}
}