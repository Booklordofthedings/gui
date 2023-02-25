namespace gui;
using gui.Internal;
using raylib_beef;
using System;
using System.Collections;
class Screen
{
	public bool IsActive = false; //Inactive Screens wont be updated and rendered
	public String Name;
	public List<Component> Components = new .() ~ DeleteContainerAndItems!(_); //Stores all objects on the screen
	public Component CurrentlySelected = null; //A reference to the currently selected object for quick acess
	public Rect ScreenRect; //Bounding box of the screen

	

	public this(String pName)
	{
		Name = pName;
	}

	public void Update()
	{
		//Default program update
		for(let e in Components)
			e.Update( CurrentlySelected == e ? true : false);

		//Handle a normal press
		if(Raylib.IsMouseButtonPressed(.MOUSE_LEFT_BUTTON))
		{
			Component lastClicked = null;

			//Figures out the topmost collision
			for(var e  in Components)
			{
				Point p = scope Point(Raylib.GetMouseX(), Raylib.GetMouseY());
				if(e.Bounds.OverlapPoint(p))
				{
					for(var b in e.Collision)
						if(b.OverlapPoint(p))
							lastClicked = e; //Figures out the topmost entry
				}
			}

			if(lastClicked != null)
			{
				if(CurrentlySelected == lastClicked)
					lastClicked.OnDoubleClick();
				else
				{
					lastClicked.OnClick();
					CurrentlySelected = lastClicked;
				}
			}
		}
	}

	///Draws the content of the screen
	public void Draw()
	{
		for(let e in Components)
			e.Draw(.(0,0));
	}

	public void DrawLate()
	{
		for(let e in Components)
			e.DrawLate();
	}
}