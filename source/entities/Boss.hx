package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.math.FlxRandom;
import states.EndState;
import states.MenuState;
import states.PlayState;

/**
 * ...
 * @author tf
 */

class Boss extends FlxSprite
{
	var target:FlxSprite;
	var _cam:FlxSprite;
	var grp:FlxTypedGroup<Enemy>;
	var delay:Float = 3;
	public var hp:Int = Reg.bossHP;
	
	public function new(X:Float = 0, Y:Float = 0, C:FlxSprite, G:FlxTypedGroup<Enemy>, T:FlxSprite) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.boss2__png, true, 61, 64);
		animation.add("idle", [0, 1, 2, 1], 6, true);
		animation.play("idle");
		visible = false;
		//makeGraphic(32, 32);
		_cam = C;
		grp = G;
		target = T;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		behavior();
	}
	
	public function behavior() {
		var dly:Float = Reg.bossDelay;
		
		if (visible) {
			var random:FlxRandom = new FlxRandom(); 
			var shot:Int = random.int(0, 3);
			y += (target.y-20 - y) * 0.02;
			
			if (delay <= 0) {
				if(shot == 0){
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 160, 250, false));
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 180, 250, false));
					grp.add(new EnemyBullet(x, y+20, _cam, grp, 200, 250, false));
				}
				else if(shot == 1){
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 170, 250, false));
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 190, 250, false));
				}
				else if(shot == 2){
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 155, 250, false));
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 175, 250, false));
					grp.add(new EnemyBullet(x, y+20, _cam, grp, 195, 250, false));
					grp.add(new EnemyBullet(x, y+20, _cam, grp, 215, 250, false));
				}
				else if(shot == 3){
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 180, 350, false));
					grp.add(new EnemyBullet(x,y+20,_cam,grp, 180, 300, false));
					grp.add(new EnemyBullet(x, y+20, _cam, grp, 180, 250, false));
				}
				delay = dly;
			}
			else 
				delay -= FlxG.elapsed;
		}
		else if (_cam.x >= 6084)
			visible = true;
	}
	
	public function takeDmg(D:Int) {
		if(visible)hp -= D;
		visible = false;
		
		if (hp <= 0) {
			Reg.score += 1000;
			Reg.scoreMult += 0.2;
			Reg.lvlSpeed += 25;
			Reg.bossHP += 10;
			Reg.bossDelay -= 0.1;
			
			Reg.playerOptions = PlayState._player.options;
			Reg.playerWeapon = PlayState._player.weaponType;
			Reg.playerLives = PlayState.hp;
			
			trace(Reg.playerWeapon);
			trace(Reg.playerOptions);
			FlxG.switchState(new EndState());
		}		
	}
}