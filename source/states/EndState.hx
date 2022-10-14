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
import openfl.utils.Assets;

/**
 * A FlxState which can be used for the game's menu.
 */

class EndState extends FlxState
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
		_PressStart = new FlxText(0, 50, 0, "The Plot Thickens!\n(PRESS ENTER!)", 15);
		_Title = new FlxSprite(0,0);
		//_Title.screenCenter();
		_Title.loadGraphic(AssetPaths.ending__png, false, 640,260);
		_PressStart.screenCenter();
		_PressStart.y += 120;
		add(_Title);
		add(_PressStart);
			
		trace(Reg.playerWeapon);
		trace(Reg.playerOptions);
	  
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
	
	

	
	

public function blink_text():Void
{
 
}
}

