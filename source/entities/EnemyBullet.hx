package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
/**
 * ...
 * @author ...
 */
class EnemyBullet extends Enemy
{

	public function new(X:Float = 0, Y:Float = 0, C:FlxSprite, G:FlxTypedGroup<Enemy>, A:Float, S:Float, D:Bool = true)
	{
		super(X, Y, C, G);
		
		//makeGraphic(16, 16);
		loadGraphic(AssetPaths.enemyBullet__png, false, 14, 14);
		//FlxAngle.rotatePoint(S, 0, 0, 0, A, velocity);
		var f:FlxPoint = FlxPoint.get();

		f.rotate(f, A);
		dstry = D;
	}
	
}