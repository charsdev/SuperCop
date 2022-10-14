package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Background extends FlxSprite
{
	var _bg1:FlxSprite;
	var _bg2:FlxSprite;
	
	public function new(X:Float=0, Y:Float=0, B:Dynamic, S:Float=0)
	{
		super(X, Y);
		
		makeGraphic(1, 1, FlxColor.TRANSPARENT);
		
		_bg1 = new FlxSprite(X, Y);
		_bg1.loadGraphic(B);
		_bg1.velocity.x = S;
		
		_bg2 = new FlxSprite(X+_bg1.width, Y);
		_bg2.loadGraphic(B);
		_bg2.velocity.x = S;
	}
	
	
}