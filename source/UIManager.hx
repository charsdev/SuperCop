package ;

import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxSpriteUtil; 
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxCamera;

/**
 * ...
 * @author ...
 */
class UIManager extends FlxTypedGroup<FlxSprite>
{
	private var scoreText:FlxText;
	private var highscoreText:FlxText;
	private var gameOverText:FlxText;
    private var sprHealth:FlxSprite;
    private var txtHealth:FlxText;
	private var _btnContinue:FlxButton;
	private var _btnMenu:FlxButton;
    private var Highscore:Int = 0;
	public var _cmr:FlxSprite;


	public function new() 
	{
		super();
		
		txtHealth = new FlxText(8, 40, 0, "3 / 3", 8);
		txtHealth.setBorderStyle(FlxText.BORDER_SHADOW, FlxColor.GRAY, 1, 1);
        
		sprHealth = new FlxSprite(0, txtHealth.y + (txtHealth.height / 2)  - 4, AssetPaths.health__png);
		scoreText = new FlxText(0, 0, 0, "SCORE: 0", 16);
		highscoreText = new FlxText(0, 20, 0, "HIGHSCORE: " + Highscore, 16);
		gameOverText = new FlxText(0, 0, 0, "GAME OVER", 32);
		gameOverText.visible = false;
		FlxSpriteUtil.screenCenter(gameOverText);
		

        add(txtHealth);
		add(sprHealth);
		add(scoreText);
		add(highscoreText);
		add(gameOverText);
		
		
	}
	
	override public function update() {
	 
	 sprHealth.x = _cmr.x - 300;
	 txtHealth.x = _cmr.x - 300;
	 scoreText.x = _cmr.x - 300;
	 highscoreText.x = _cmr.x - 300;
	 }
	
	public function updateScoreTexts(score:Int):Void
	{
		scoreText.text = "SCORE: " + score;
		if (score > Highscore)
		{
			Highscore = score;
			highscoreText.text = "HIGHSCORE: " + Highscore;
		}

	}
	
	public function udpateHealth(health:Int):Void
	{
	  txtHealth.text = Std.string(health) + " / 3";
	}
	
	public function setGameOverTextVisible(value:Bool = true):Void
	{
		gameOverText.visible = value;
  
	}
}