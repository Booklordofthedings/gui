namespace gui;
using System;
using System.Collections;
public class Screen
{
    public List<Component> components = new List<Component>();
    public this()
    {
    }
    public ~this()
    {
        DeleteContainerAndItems!(components);
    }
    public void Draw()
    {
        for(Component c in components)
        {
            c.Draw();
        }
    }
    public void Update()
    {
        for(Component c in components)
        {
            c.Update();
        }
    }
}
