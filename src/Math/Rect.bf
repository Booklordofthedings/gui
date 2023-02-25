namespace gui.Math;

struct Rect
{
	public Vec2 Position;
	public float X
	{
		public get {
			return Position.x;
		}
	}
	public float Y
	{
		public get {
			return Position.y;
		}
	}
	public float Width;
	public float Height;

	public this()
	{
		Position.x = 0;
		Position.y = 0;
		Width = 0;
		Height = 0;
	}
	public this(float x, float y, float w, float h)
	{
		Position.x  = x;
		Position.y = y;
		Width = w;
		Height = h;
	}


	public bool Overlap(Point pPoint)
	{
		if(!(pPoint.X >= Position.x  && pPoint.X <= Position.y))
			return false;
		if(!(pPoint.Y >= Position.y && pPoint.Y <= Position.y))
			return false;
		return true;
	}

	public bool Overlap(Circle pCircle)
	{ //There are faster ways that we dont rly need
		System.Collections.List<Point> pList = scope System.Collections.List<Point>();
		pList.Add(.(X,Y));
		pList.Add(.(X,Y + Height));
		pList.Add(.(X + Width, Y));
		pList.Add(.(X + Width, Y + Height));
		for(let i in pList)
		{
			if(i.Overlap(pCircle))
				return true;
		}
		return false;
	}

	public bool Overlap(Rect pRect)
	{
		Rect larger;
		Rect smaller;
		float vol_1 = pRect.X * pRect.Y;
		float vol_2 = X * Y;
		if(vol_2 > vol_1)
		{
			larger = this;
			smaller = pRect;
		}
		else
		{
			larger = pRect;
			smaller = this;
		}

		System.Collections.List<Point> pList = scope .();
		pList.Add(.(smaller.X,smaller.Y));
		pList.Add(.(smaller.X + smaller.Width,smaller.Y));
		pList.Add(.(smaller.X + smaller.Width,smaller.Y + smaller.Height));
		pList.Add(.(smaller.X,smaller.Y + smaller.Height));

		for(var i in pList)
		{
			if(larger.Overlap(i))
				return true;
		}
		return false;
	} 
}