package entities;

import flixel.util.FlxColor;
import flixel.FlxG;

/*
 * ...
 * @author ...
 */
class NormalShot extends PlayerBullet
{
	
	public function new(X:Float=0, Y:Float=0)//, D:Float) 
	{
		vel = 1000;
		super(X, Y);// , D);
		
		makeGraphic(16, 7, FlxColor.MAGENTA);
		//FlxG.camera.shake(0.01, 0.05);
		
	}
	
}