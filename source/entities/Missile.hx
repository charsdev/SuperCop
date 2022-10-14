package entities;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
/**
 * ...
 * @author ...
 */
class Missile extends PlayerBullet 
{

	public function new(X:Float=0, Y:Float=0)//, D:Float) 
	{
		vel = 500;
		super(X, Y);// , D);
		
		//makeGraphic(32, 16, FlxColor.BLUE);		
		loadGraphic(AssetPaths.missile__png, true, 24, 12);
	}
	
	override public function update(elapsed:Float)
	{
		vel = Math.min(vel + 700 * FlxG.elapsed, 1500);
		super.update(elapsed);
	}
}