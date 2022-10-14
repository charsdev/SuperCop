package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import states.PlayState;

/**
 * ...
 * @author ...
 */
class PowerUp extends FlxSprite
{	
	var group:FlxTypedGroup<PowerUp>;
	public function new(X:Float=0, Y:Float=0, G:FlxTypedGroup<PowerUp>)
	{
		super(X, Y);
		
		group = G;
		makeGraphic(16, 16, FlxColor.RED);
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if (x + width < PlayState._cmrControl.x - 320){
			group.remove(this);
			destroy();
		}
	}
}