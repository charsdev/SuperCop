package states ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxDestroyUtil;
import flixel.effects.FlxFlicker;
import flixel.group.FlxGroup;

using flixel.util.FlxSpriteUtil;

import haxe.xml.Fast;
import openfl.Assets;

/**
 * A FlxState which can be used for the game's menu.
 */

class MenuState extends FlxState
{
	private var _btnPlay:FlxButton;
    private var _PressStart:FlxText;
	private var _Enter:Bool;
	private var _Title:FlxSprite;
	private var _Music:FlxSound;
	private var xml:Xml;
	private var fast:Fast;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_Title = new FlxSprite(0, 0, AssetPaths.title__png);
		add(_Title);
		_PressStart = new FlxText(0, 50, 0, "PRESS START", 15);
		add(_PressStart);
		_Title.screenCenter();
		_PressStart.screenCenter();
		_PressStart.y += 50;
		var copyright = new FlxText(0, 455, 0, "COPYRIGHT 2014 FREAKCODE", 10);
		add(copyright);
	  
		super.create();
		
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		 _PressStart = FlxDestroyUtil.destroy( _PressStart);
		super.destroy();
		
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float)
	{

		super.update(elapsed);

		     // FlxG.sound.playMusic(AssetPaths.MENU__sfk);

		if (!FlxFlicker.isFlickering(_PressStart))
			FlxFlicker.flicker(_PressStart,1000,0.5);
		
		_Enter = FlxG.keys.anyPressed(["SPACE", "ENTER"]);
		
		if (_Enter) {
			FlxG.switchState(new PlayState());
		}			
	}
}

