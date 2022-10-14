package entities;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;
import states.PlayState;

/**
 * ...
 * @author ...
 */
class PlayerOption extends FlxSprite
{
	var target:PlayerOption;
	var grp:FlxTypedGroup<PlayerBullet>;
	static public var maxD:Float = 30;
	
	public function new(X:Float = 0, Y:Float = 0, T:PlayerOption, G:FlxTypedGroup<PlayerBullet>)
	{
		super();
		
		makeGraphic(12, 12);
		target = T;
		grp = G;
	}	
	
	override public function draw() {
		super.draw();
		
		if (target != null && !target.exists) {
			destroy();
			return;
		}
		if (target == null && FlxMath.distanceBetween(PlayState._player, this) > maxD) {
			//FlxAngle.rotatePoint((FlxMath.distanceBetween(PlayState._player, this) - maxD)*60, 0, 0, 0, FlxAngle.angleBetween(this, PlayState._player, true), velocity);				
		}
		else if (target != null && FlxMath.distanceBetween(target, this) > maxD) {
			//FlxAngle.rotatePoint((FlxMath.distanceBetween(target, this) - maxD)*60, 0, 0, 0, FlxAngle.angleBetween(this, target, true), velocity);
		}
	}
	
	public function shoot() {
		var shot:PlayerBullet;
		
		if (PlayState._player.weaponType == "normal") {
			shot = new NormalShot(x +20, y +7);
			shot.grp = grp;
			shot.cam = PlayState._cmrControl;
			grp.add(shot);			
		}
		
		else if (PlayState._player.weaponType == "missile") {
			shot = new Missile(x +20, y +7);
			shot.grp = grp;
			shot.cam = PlayState._cmrControl;
			grp.add(shot);			
		}
		
		if (target != null) target.shoot();
	}
	
	override public function destroy() {
		if (target != null) target.destroy();
		super.destroy();
	}
}