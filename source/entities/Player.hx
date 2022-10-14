package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxVector;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import states.PlayState;

class Player extends FlxSprite
{
	var _mVector:FlxVector = new FlxVector();
	var maxSpeed:Float = 200;
	var accel:Float = 3000;
	var deaccel:Float = 5000;
	public var afterDeath:Float = 0;
	var state:PlayState;
	
	public var weaponType:String;
	var shotDelay:Float = 0;
	var _cam:FlxSprite;
	public var shots:FlxTypedGroup<PlayerBullet>;
	
	public var pwrUp:Int = 0;
	public var shield:Bool;
	public var options:Int = 0;
	public var lOption:PlayerOption;
	
	
	public function new(X:Float = 0, Y:Float = 0, CAM:FlxSprite, S:PlayState )
	{
		super(X, Y);
		
		loadGraphic(AssetPaths.Cop__png, true, 32, 14);
		animation.add("idle", [0, 1], 12, true);
		animation.play("idle");
		
		shield = false;
		_cam = CAM;
		state = S;
	}
	
	override public function update(elapsed:Float)
	{
		checkControls();
		checkOOB();
		weapon();
		if (afterDeath > 0) {
			afterDeath -= FlxG.elapsed;
			alpha = 0.5;
		}
		else alpha = 1;
		
		super.update(elapsed);
	}
	
	private function checkControls()
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		
		_up = FlxG.keys.anyPressed(["UP", "W"]);
		_down = FlxG.keys.anyPressed(["DOWN", "S"]);
		_left = FlxG.keys.anyPressed(["LEFT", "A"]);
		_right = FlxG.keys.anyPressed(["RIGHT", "D"]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;

		if (_up)
			moveXY(0, -accel);
		else if (_down)
			moveXY(0, accel);
		if (_left)
			moveXY(-accel,0);
		else if (_right)
			moveXY(accel,0);
			
		if (_mVector.x > 0 && !_right)
				_mVector.x = Math.max(0, _mVector.x - deaccel*FlxG.elapsed);
		else if (_mVector.x < 0 && !_left)
				_mVector.x = Math.min(0, _mVector.x + deaccel*FlxG.elapsed);
			
		if (_mVector.y > 0 && !_down)
				_mVector.y = Math.max(0, _mVector.y - deaccel*FlxG.elapsed);
		else if (_mVector.y < 0 && !_up)
				_mVector.y = Math.min(0, _mVector.y + deaccel * FlxG.elapsed);
				
		if (FlxG.keys.justPressed.X || FlxG.mouse.justPressedRight)
		{
			if (pwrUp == 1) { weaponType = "missile"; pwrUp = 0; }
			else if (pwrUp == 2) { shield = true; pwrUp = 0; }
			else if (pwrUp >= 3){ state.createOption(); pwrUp = 0; }
		}
		
		velocity.x = _mVector.x + _cam.velocity.x;
		velocity.y = _mVector.y;
		
	}
	
	public function moveXY(X:Float = 0, Y:Float = 0):Void
	{
		_mVector.x = Math.max( -maxSpeed, Math.min(_mVector.x + X*FlxG.elapsed, maxSpeed));
		_mVector.y = Math.max( -maxSpeed, Math.min(_mVector.y + Y*FlxG.elapsed, maxSpeed));
	}
	
	private function checkOOB():Void
	{
		var _c0:Float = _cam.x-320;
		var _c1:Float = _cam.x+320;
		
		if (x < _c0) { x = _c0; _mVector.x = 0; }
		else if (x > _c1)
		{
			x = _c1 - width;
			_mVector.x = 0;
		}
		
		if (y < 0) { y = 0; _mVector.y = 0; }
		else if (y > FlxG.height - height)
		{
			y = FlxG.height - height;
			_mVector.y = 0;
		}
	}
	
	private function weapon()
	{
		var _btn:Bool;
		var shot:PlayerBullet;
		
		if (FlxG.mouse.pressed || FlxG.keys.anyPressed(["Z", "SPACE"]))
			_btn = true;
		else _btn = false;    
		
		if (weaponType == "normal")
		{
			var dly:Float = 0.4;
		
			shotDelay -= FlxG.elapsed;
	        
			if (_btn && shotDelay <= 0)
			{
				shot = new NormalShot(x +20, y +7);
				shot.grp = shots;
				shot.cam = _cam;
				shots.add(shot);// , FlxAngle.angleBetweenMouse(this, true)));
				if(lOption != null)lOption.shoot();
				FlxG.sound.play(AssetPaths.normalshot__wav);

				shotDelay = dly;
				FlxG.camera.shake(0.005, 0.1);
			}
		}
		
		if (weaponType == "missile")
		{
			var dly:Float = 0.6;
			
			shotDelay -= FlxG.elapsed;
	
			if (_btn && shotDelay <= 0)
			{
				shot = new Missile(x +width, y );
				shot.grp = shots;
				shot.cam = _cam;
				shots.add(shot);// , FlxAngle.angleBetweenMouse(this, true)));
				if(lOption != null)lOption.shoot();
				
				FlxG.sound.play(AssetPaths.misile__wav);
				shotDelay = dly;
				FlxG.camera.shake(0.005, 0.11);
			}
		}
	}
	
	public function updateAD(a:Float)
		afterDeath = a;
		
	public function destroyOptions() {
		options = 0;
		if (lOption != null) {
			lOption.destroy();
			lOption = null;
		}
	}
}