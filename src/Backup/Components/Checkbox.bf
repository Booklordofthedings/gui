namespace gui.Components;
using raylib_beef;
using System;
class Checkbox : Component
{
	public this(String pName) : base(pName, "Checkbox")
	{

	}

	public override void Update(bool isSelected)
	{

	}

	public override void Draw(int16[2] offset)
	{
		Bounds.Position.x = 600;
		Bounds.Position.y = 600;
		Raylib.DrawRectangleLines((.)Bounds.Position.x, (.)Bounds.Position.y,16,16,.BLACK);
		Raylib.DrawText("Checked",(.)Bounds.Position.x + 18, (.)Bounds.Position.y +10,10, .BLACK);
	}

	
}