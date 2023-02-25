namespace gui.Components;
using gui.Internal;
using raylib_beef;
using raylib_beef.Types;
using System;
class Button : Component
{
	public String Label;
	public function void() OnClick = null;

	public Color Default = .LIGHTGRAY;
	public Color Selected;
	public Color Clicked;
	public Color Disabled;


	public override void Update(bool IsSelected)
	{
		if(IsSelected)
			Default = .BLUE;
	}

	public override void Draw(int16[2] pOffset)
	{
		Raylib.DrawRectangle((.)Bounds.Position.x + pOffset[0], (.)Bounds.Position.y + pOffset[1], (.)Bounds.Width, (.)Bounds.Height, Default);
		Raylib.DrawText(Label, (.)Bounds.Position.x + pOffset[0] + (.)Bounds.Width/2 - Raylib.MeasureText(Label,10)/2, (.)Bounds.Position.y + pOffset[1] + (.)Bounds.Height/2 - 5, 10, .BLACK);
	}

	public override void OnClick()
	{
		base.OnClick();
		if(Default == .LIGHTGRAY)
			Default = .LIME;
		else if(Default == .LIME)
			Default = .LIGHTGRAY;
	}

	public this(String pName, Rect pPosition) : base(pName, "Button")
	{
		Label = pName;
		this.Bounds = pPosition;
		this.Collision.Add(pPosition);
	}
}