package entities;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class EnemyStatic extends Enemy
{

	public function new(X:Float = 0, Y:Float = 0, C:FlxSprite, G:FlxTypedGroup<Enemy>)  
	{
		super(X, Y, C, G);
		score = 10;
		loadGraphic(AssetPaths.enemy1__png, true, 23, 26);
		animation.add("idle", [0, 1], 6, true);
		animation.play("idle");
		
		//makeGraphic(24,24,FlxColor.RED);
	}
}