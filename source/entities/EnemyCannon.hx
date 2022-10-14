package entities;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class EnemyCannon extends Enemy
{
	var delay:Float = 0;
	
	public function new(X:Float=0, Y:Float=0, C:FlxSprite, G:FlxTypedGroup<Enemy>) 
	{
		super(X, Y, C, G);
		score = 30;
		loadGraphic(AssetPaths.enemy2__png,false, 33,32);
	}
	
	override public function update(elapsed:Float) {
		var dly:Float = 1;
		
		super.update(elapsed);
		
		if (delay >= 0)
			delay -= FlxG.elapsed;
		else {
			grp.add(new EnemyBullet(x, y, cam, grp, -135, 120));
			delay = dly;
		}
	}
	
}