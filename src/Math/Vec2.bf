namespace gui.Math;
using System;
//A 2d vector
struct Vec2
{
	public float x;
	public float y;

	public this()
	{
		x  = 0;
		y = 0;
	}

	public this(float pVal)
	{
		x = pVal;
		y = pVal;
	}

	public this(float pX, float pY)
	{
		x = pX;
		y = pY;
	}

	public static readonly Vec2 one = Vec2(1,1);
	public static readonly Vec2 zero = Vec2(0,0);
	public static readonly Vec2 down = Vec2(0, 1);
	public static readonly Vec2 up = Vec2(0, -1);
	public static readonly Vec2 left = Vec2(-1, 0);
	public static readonly Vec2 right = Vec2(1, 0);




	public float lenght
	{
		public get {
			return Math.Sqrt(x * x + y * y);
		}
	}

	public float sqrLength
	{
		public get {
			return x * x + y * y;
		}
	}

	public Vec2 normalized
	{
		public get {
			var l = this.lenght;
			return .(this.x / l, this.y / l);
		}
	}

	public override void ToString(String strBuffer)
	{
		strBuffer.Append(scope $"\{{x}, {y}\}");
	}

	[Commutable]
	public static Vec2 operator+(Vec2 lhs,Vec2 rhs)
	{
		return Vec2(lhs.x + rhs.x, lhs.y + rhs.y);
	}

	public static Vec2 operator-(Vec2 lhs, Vec2 rhs)
	{
		return Vec2(lhs.x - rhs.x, lhs.y - rhs.y);
	}

	[Commutable]
	public static Vec2 operator*(Vec2 lhs, float rhs)
	{
		return Vec2(lhs.x * rhs, lhs.y * rhs);
	}

	public static Vec2 operator/(Vec2 lhs, float rhs)
	{
		return Vec2(lhs.x / rhs, lhs.y / rhs);
	}

	public static bool operator==(Vec2 lhs, Vec2 rhs)
	{
		Vec2 diff = .(lhs.x - rhs.x, lhs.y - rhs.y);
		return diff.lenght < 1e-5;
	}
}