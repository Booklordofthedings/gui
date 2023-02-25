namespace gui;
using raylib_beef;
using System.Collections;
using System;
class RMenu
{
	public List<(String, function void())> Callbacks = new List<(String, function void())>() ~ delete _;

	public void Draw()
	{
		int32 size = (.)Callbacks.Count * 10 + 10;
		int32 width = 150;
		for(let e in Callbacks)
		{
			var l = Raylib.MeasureText(e.0, 10);
			l = l + 10;
			if(l > width)
				width = l;
		}
		Raylib.DrawRectangle(0,0,width, size, Theme.DefaultTheme().SecondaryBackground);
		Raylib.DrawRectangleLines(0,0,width, size, Theme.DefaultTheme().Primary);

		var vPos  = 0;
		for(let e in Callbacks)
		{
			Raylib.DrawText(e.0, 3, (.)(3 + vPos * 10), 10, Theme.DefaultTheme().Primary);
			vPos++;
		}
	}
}
