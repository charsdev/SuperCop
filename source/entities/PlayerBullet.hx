package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;

/**
 * ...
 * @author ...
 */

class PlayerBullet extends FlxSprite
{
	var vel:Float;
	public var cam:FlxSprite;
	public var grp:FlxTypedGroup<PlayerBullet>;
	
	public function new(X:Float=0, Y:Float=0)//, D:Float)
	{
		super(X, Y);
		
		//angle = D;
		
		//FlxAngle.rotatePoint(vel, 0, 0, 0, D, velocity);
	}
	
	override public function update(elapsed:Float)
	{
		velocity.x = vel;
		super.update(elapsed);
		checkOOB();
	}
	
	function checkOOB()
	{
		var _c0:Float = cam.x-320;
		var _c1:Float = cam.x+320;
		
		if (x < _c0){ grp.remove(this); destroy();}
		else if (x > _c1){ grp.remove(this); destroy();}
}
}