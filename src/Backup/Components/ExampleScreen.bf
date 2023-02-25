namespace gui.Example;
using gui.Components;
using gui.Internal;
class ExampleScreen : Screen
{
	public this() : base("ExampleScreen")
	{

		Components.Add(new Button("Testbox",new .(10,10, 400,400)));
	}
}