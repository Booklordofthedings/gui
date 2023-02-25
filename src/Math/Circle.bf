namespace gui.Math;

struct Circle
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
	public float Radius;
	public bool Overlap(Point pPoint)
	{
		Vec2 relation = pPoint.Position - Position;
		if(relation.lenght <= Radius)
			return true;
		return false;
	}

	public bool Overlap(Circle pCircle)
	{
		Vec2 relation = pCircle.Position - Position;
		if(relation.lenght <= Radius + pCircle.Radius)
			return true;
		return false;
	}
	public bool Overlap(Rect pRect)
	{
		Vec2 TL = pRect.Position;
		Vec2 TR = .(pRect.Position.x + pRect.Width, pRect.Position.y);
		Vec2 BL = .(pRect.Position.x, pRect.Position.y + pRect.Height);
		Vec2 BR = .(pRect.Position.x + pRect.Width, pRect.Position.y + pRect.Height);

		Point point = .(0,0);
		point.Position = TL;
		if(Overlap(point))
			return true;
		point.Position = TR;
		if(Overlap(point))
			return true;
		point.Position = BL;
		if(Overlap(point))
			return true;
		point.Position = BL;
		if(Overlap(point))
			return true;
		point.Position = BR;
		if(Overlap(point))
			return true;

		return false;
	}
}
