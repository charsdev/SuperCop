package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;


/**
 * ...
 * @author tf
 */

class Enemy extends FlxSprite
{
	public var cam:FlxSprite;
	public var grp:FlxTypedGroup<Enemy>;
	public var dstry:Bool;
	public var score:Int;
	
	public function new(X:Float = 0, Y:Float = 0, C:FlxSprite, G:FlxTypedGroup<Enemy>) 
	{
		super(X, Y);
		
		cam = C;
		grp = G;
		dstry = true;
		score = 0;
	}
	
/*	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (x + width < cam.x - 320){
			grp.remove(this);
			destroy();
		}
	}*/
}