namespace gui.Components;
using System;
using System.Collections;
using raylib_beef;
class Container : Component
{
	public String Label = "Container";
	List<Component> Content = new .() ~ DeleteContainerAndItems!(_);


	public override void Update(bool isSelected)
	{
		//Transform.x = (.)Raylib.GetMouseX();
		//Transform.y = (.)Raylib.GetMouseY();
	}

	public override void Draw(int16[2] pOffset)
	{
		for(let e in Content)
			e.Draw(.((.)Bounds.Position.x + 2, (.)Bounds.Position.y + 13));

		Raylib.DrawText(Label, (.)Bounds.Position.x, (.)Bounds.Position.y,10, .BLACK);
		Raylib.DrawRectangleLines((.)Bounds.Position.x, (.)Bounds.Position.y + 11, (.)Bounds.Width, (.)Bounds.Height - 11, .BLACK);
	}

	public override void OnClick()
	{
		base.OnClick();
	}

	public this(String pName, String pComponentName) : base(pName, pComponentName)
	{

	}
}