package;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil; 
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flash.system.System;
//entities:
import states.MenuState;
import states.PlayState;
import flixel.effects.FlxFlicker;

class InterfazUsuario extends FlxTypedGroup<FlxSprite>
{
	private var TextoScore:FlxText;
	private var TextoHighScore:FlxText;
	private var textoPowerUp:FlxText;
	public var GameOver:FlxText;
	private var Linea:FlxText;
	private var Lives:FlxText;
	public var _cmr:FlxSprite;
	var HPbossBG:FlxSprite;
	var HPbossG:FlxSprite;
	var HPbossW:FlxSprite;
	var HPbossR:FlxSprite;
	
	public static var score:Int;
	public static var highScore:Int;
	public static var lvlSpeed:Float;
	
	public function new() 
	{
		super();
		
		score = Reg.score;
		highScore = Reg.highScore;
		
		TextoScore = new FlxText("Score: " + score, 10);
		//FlxSpriteUtil.screenCenter(TextoScore);
		TextoScore.y = 2;
		TextoHighScore = new FlxText("Highscore: " + highScore, 10);
		//FlxSpriteUtil.screenCenter(TextoHighScore);
		TextoHighScore.y = 2;
		textoPowerUp = new FlxText(" ", 10);
		textoPowerUp.y = 2;
		
		HPbossBG = new FlxSprite(5878, FlxG.height - 16);
		HPbossBG.makeGraphic(404, 14, FlxColor.BLACK);
		HPbossBG.visible = false;
		HPbossG = new FlxSprite(5880, FlxG.height - 14);
		HPbossG.makeGraphic(400, 10, FlxColor.GRAY);
		HPbossG.visible = false;
		HPbossW = new FlxSprite(5880, FlxG.height - 14);
		HPbossW.makeGraphic(400, 10);
		HPbossW.origin.set(0, 0);
		HPbossW.visible = false;
		HPbossR = new FlxSprite(5880, FlxG.height - 14);
		HPbossR.makeGraphic(400, 10,FlxColor.RED);
		HPbossR.origin.set(0, 0);
		HPbossR.visible = false;
		
		GameOver = new FlxText("     Game Over\n ENTER to restart");// , 20);
		GameOver.setFormat(20, FlxColor.BLUE);
		GameOver.screenCenter();
		
		
		GameOver.visible = false;
		
		Lives = new FlxText("Lives: ", 10);
		Lives.screenCenter();
		Lives.y = 2;
		Linea = new FlxText("_____________________________________________________________________________________________________________________________________________________________", 10);
		Linea.screenCenter();
		Linea.y = 5;
		 
		add(TextoScore);
		add(TextoHighScore);
		add(textoPowerUp);
		add(GameOver);
		add(Lives);
		add(Linea);
		add(HPbossBG);
		add(HPbossG);
		add(HPbossW);
		add(HPbossR);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		TextoScore.x =  _cmr.x - 100;
		TextoHighScore.x = _cmr.x-10;
		textoPowerUp.x = _cmr.x  + 100;
		GameOver.x = _cmr.x - 300;
		Lives.x = _cmr.x - 200;
		Linea.x = _cmr.x - 360;
		if (GameOver.visible == true){
			ReiniciarJuego();
		}
		if (HPbossW.scale.x > HPbossR.scale.x)
			HPbossW.scale.x -= 0.002;
		var s:Int = PlayState._player.pwrUp;
		
		if (s == 1)
			textoPowerUp.text = "Press X or M2 for MISSILES!"
		else if (s == 2)
			textoPowerUp.text = "Press X or M2 for SHIELD!"
		else if (s >= 3)
			textoPowerUp.text = "Press X or M2 for COP BUDDY!"
		else
			textoPowerUp.text = " ";
			
		if (!FlxFlicker.isFlickering(textoPowerUp))
			FlxFlicker.flicker(textoPowerUp,1000,0.5);
	}

	public function ActualizarScore(Pscore:Int):Void 
	{
		TextoScore.text = "Score: " + Pscore;
		if (Pscore > highScore)
			highScore = Pscore;
			TextoHighScore.text = "Highscore: " + highScore;
			
		Reg.score = Pscore;
		Reg.highScore = highScore;
	}
	
	
	
	public function ReiniciarJuego():Void
	{		
		Reg.score = 0;
		Reg.scoreMult = 1;
		Reg.lvlSpeed = 100;
		Reg.bossHP = 30;
		Reg.bossDelay = 1;
		
		Reg.playerLives = 3;
		Reg.playerOptions = 0;
		Reg.playerWeapon = "normal";
		
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new PlayState());
		}
		else if (FlxG.keys.pressed.M) {
			FlxG.switchState(new MenuState());
		}
		else if (FlxG.keys.pressed.ESCAPE)	
			System.exit(0);
	}
	
	public function showBars() {
		HPbossBG.visible = HPbossG.visible = HPbossW.visible = HPbossR.visible = true;
	}

	public function setHP(L:Int) {
		HPbossR.scale.x = L/Reg.bossHP;
	}
}