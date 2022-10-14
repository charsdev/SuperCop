package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class EnemySpawner extends FlxSprite
{
	public var cam:FlxSprite;
	public var grp:FlxTypedGroup<Enemy>;
	var type:Int;
	
	public function new(X:Float=0, Y:Float=0, T:Int, C:FlxSprite, G:FlxTypedGroup<Enemy>) 
	{
		super(X, Y);	
		type = T;
		cam = C;
		grp = G;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (x <= cam.x + 320) {
			
			if (type == 0)
				grp.add(new EnemyStatic(x, y, cam, grp));				
			if (type == 1)
				grp.add(new EnemyTorpedo(x, y, cam, grp));
			if (type == 2)
				grp.add(new EnemyCannon(x, y, cam, grp));
				
			destroy();
		}
	}
}