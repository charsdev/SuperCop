package entities;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author ...
 */
class EnemyTorpedo extends Enemy
{

	public function new(X:Float=0, Y:Float=0, C:FlxSprite, G:FlxTypedGroup<Enemy>) 
	{
		super(X, Y, C, G);
		score = 20;
		loadGraphic(AssetPaths.enemy3__png, true, 20, 13);
		animation.add("idle", [0, 1], 6, true);
		animation.play("idle");
		
		velocity.x = -250;
	}
}