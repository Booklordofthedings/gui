namespace gui;
using LybLog;
using gui.Internal;
using System;
using System.Collections;
abstract class Component
{
	//Fields every component has
	public String Name; //Used to try to find a specifc Component
	public String ComponentName; //Used to typefind components
	public Rect Bounds ~ delete _; //Outer bounding box of the component
	public List<Shape> Collision ~ delete _; //The exact collision boxes of the component

	public this(String pName, String pComponentName)
	{
		Collision = new List<Shape>();
		Name = pName;
		ComponentName = pComponentName;
	}

	//Required functions
	public abstract void Update(bool isSelected);
	public abstract void Draw(int16[2] offset);

	//Optional functions
	public virtual void DrawLate(){};
	public virtual void SelectedUpdate(){};
	public virtual void OnClick(){}
	public virtual void OnDoubleClick(){}
	public virtual void OnRClick(){}
	public virtual void OnPaste(char8* pContent){}

}