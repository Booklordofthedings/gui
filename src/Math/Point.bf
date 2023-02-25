namespace gui.Math;
using System;
struct Point
{
	public Vec2 Position;
	public float X {
		public get {
			return Position.x;
		}
	}
	public float Y {
		public get {
			return Position.y;
		}
	}

	public this(float x, float y)
	{
		Position.x = x;
		Position.y = y;
	}
	public bool Overlap(Point pPoint)
	{
		if(!(Math.Abs(Position.x - pPoint.Position.x) < float.Epsilon))
			return false;

		if(!(Math.Abs(Position.y - pPoint.Position.y) < float.Epsilon))
			return false;

		return true;
	}

	public bool Overlap(Circle pCircle)
	{
		Vec2 relation = pCircle.Position - Position;
		if(relation.lenght > pCircle.Radius)
			return false;
		return true;
	}
	public bool Overlap(Rect pRect)
	{
		if(!(Position.x >= pRect.Position.x && Position.x <= pRect.Position.x + pRect.Width))
			return false;
		if(!(Position.y >= pRect.Position.y && Position.y <= pRect.Position.y + pRect.Height))
			return false;
		return true;
	}
}