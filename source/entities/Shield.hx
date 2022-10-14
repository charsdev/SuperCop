package entities;

import flixel.FlxSprite;
import states.PlayState;

/**
 * ...
 * @author ...
 */
class Shield extends FlxSprite
{
	var target:FlxSprite;
	var iHp:Int = 3;
	var hp:Int;
	public function new(X:Float = 0, Y:Float = 0 ) 
	{
		super(X, Y);
		
		makeGraphic(4,14);
		target = PlayState._player;
		hp = iHp;
		
		scale.y = 0.5 * hp;
		updateHitbox();
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		x = target.x + target.width + 4;
		y = (target.y+target.height/2)-height/2;
	}
	
	public function dmg() {
		hp--;
		scale.y = 0.5 * hp;
		updateHitbox();
		if (hp <= 0){
			PlayState._player.shield = false;
			hp = iHp;
		}
	}
}