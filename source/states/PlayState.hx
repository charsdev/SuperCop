package states ;

import entities.Enemy;
import entities.EnemyCannon;
import entities.EnemySpawner;
import entities.EnemyStatic;
import entities.EnemyTorpedo;
import entities.Player;
import entities.PlayerBullet;
import entities.Boss;
import entities.Background;
import entities.PlayerOption;
import entities.Shield;
import entities.PowerUp;
import flixel.group.FlxGroup;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.addons.display.FlxBackdrop;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public static var GrupoVidas:FlxTypedGroup<FlxSprite>;
	private var score:Int = 0;
    private var iu:InterfazUsuario;
	private var GrupoEnemigos:FlxTypedGroup<Enemy>;
	static public var hp:Int;

	
	static public var _player:Player;
	var _shield:Shield;
	var _enemy:Enemy;
	var _boss:Boss;
	var _shots:FlxTypedGroup < PlayerBullet > ;
	var _powerUps:FlxTypedGroup < PowerUp > ;
	static public var _cmrControl:FlxSprite;
	var _tiles:FlxTilemap;
	private var _walls:FlxGroup;
    private var _topWall:FlxSprite;
	private var _downWall:FlxSprite;	
	
	override public function create():Void
	{
		super.create();
		
		GrupoVidas = new FlxTypedGroup<FlxSprite>(); //grupo de vidas por defecto == 3
		iu = new InterfazUsuario();
		
		_cmrControl = new FlxSprite(320, FlxG.height / 2);
		_cmrControl.velocity.x = Reg.lvlSpeed;
		_cmrControl.makeGraphic(1, 1,FlxColor.TRANSPARENT);
		
		//FlxG.camera.setBounds(0, 0, 6400, 360);
		FlxG.camera.follow(_cmrControl);
		
		_player = new Player (160, FlxG.height / 2, _cmrControl, this);
		_shield = new Shield();
		_shots = new FlxTypedGroup<PlayerBullet>();
		_powerUps = new FlxTypedGroup<PowerUp>();
		GrupoEnemigos = new FlxTypedGroup<Enemy>();
		_player.shots = _shots;
		_boss = new Boss(0, 0, _cmrControl, GrupoEnemigos, _player);
		/*
		_downWall = new FlxSprite(0, 0);
		_downWall.makeGraphic(FlxG.width, 10, FlxColor.TRANSPARENT);
		_walls.add(_downWall);
		*/
		 
		_topWall = new FlxSprite(0, 0);
		_topWall.makeGraphic(6400, 16, FlxColor.BLACK);
		
		hp = Reg.playerLives;
		_player.weaponType = Reg.playerWeapon;
		
		//add(_bg);
		add(new FlxBackdrop(AssetPaths.bg0__png, 0.1, 0, true, false));
		/*add(new FlxBackdrop(AssetPaths.bg__png, 0.3, 0, true, false));
		add(new FlxBackdrop(AssetPaths.bg1__png, 0.6, 0, true, false));
		add(new FlxBackdrop(AssetPaths.bg2__png, 1, 0, true, false));
		*/
		loadLevel("assets/data/Level01.oel");
		var i0:Int = 0;
		while (i0 < Reg.playerOptions) { createOption(); i0++; }
		add(_player);
		add(_shield);
		add(_shots);
		add(_powerUps);
		add(_boss);
		add(_walls);
		add(_topWall);
		add(iu);
		add(_cmrControl);
		iu._cmr = _cmrControl;
		add(GrupoEnemigos);
        GenerarVida();
		add(GrupoVidas);
			
		trace(Reg.playerWeapon);
		trace(Reg.playerOptions);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		//trace("Camera x: " + (_cmrControl.x - 320));
		
		FlxG.overlap(_player, GrupoEnemigos, killPlayerEnemy);
		FlxG.collide(_player, _tiles, killPlayerLvl);
		FlxG.overlap(_player, _powerUps, takePowerUp);
		FlxG.overlap(_shots, GrupoEnemigos, killEnemy);
		FlxG.overlap(_shots, _boss, dmgBoss);
		if(_player.shield)FlxG.overlap(_shield, GrupoEnemigos, dmgShield);
		FlxG.collide(_shots, _tiles, killShot);
		
		_shield.visible = _player.shield;		//GOD, this is ugly :c
		
		if (_cmrControl.x > 6084) {
			_cmrControl.x = 6084;
			_cmrControl.velocity.x = 0;
			GenerarVida();
			iu.showBars();
		}
	}
	
	
	
	public function loadLevel(L:String)
	{
		var _map:FlxOgmoLoader;
		
		_map = new FlxOgmoLoader(L);
		_map.loadEntities(placeEntities, "entities");
		
		_tiles = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_tiles.setTileProperties(1, FlxObject.NONE);
		_tiles.setTileProperties(2, FlxObject.ANY);
		
		add(_tiles);
	}
	
	private function placeEntities(entityString:String, entityXML:Xml):Void
	{
		var x:Int = Std.parseInt(entityXML.get("x"));
		var y:Int = Std.parseInt(entityXML.get("y"));
		
		if (entityString == "Player")
		{
			_player.x = x;
			_player.y = y;
		}
		
		else if (entityString == "enemy") //ogmo pestaña entities va el nombre de aqui
		{
			add(new EnemySpawner(x,y,0,_cmrControl,GrupoEnemigos));
		}
		
		else if (entityString == "enemy2") //ogmo pestaña entities va el nombre de aqui
		{
			add(new EnemySpawner(x,y,1,_cmrControl,GrupoEnemigos));
		}
		
		else if (entityString == "enemy3") //ogmo pestaña entities va el nombre de aqui
		{
			add(new EnemySpawner(x,y,2,_cmrControl,GrupoEnemigos));
		}
		
		else if (entityString == "Boss")
		{
			_boss.x = x;
			_boss.y = y;
		}
	}
	
	

	private function GenerarVida():Void
	{
		for (i in GrupoVidas) {
			GrupoVidas.remove(i);
			i.destroy();
		}
		
		for (i in 0...hp) {
			var vida:FlxSprite = new FlxSprite(_cmrControl.x-165 + 16  * i, 4, AssetPaths.health__png);
			vida.velocity.x = _cmrControl.velocity.x;
			GrupoVidas.add(vida);
		}
	}
	
	function killPlayerEnemy(_p, _e)
	{	
		if(_p.afterDeath <= 0){
			_p.x = _cmrControl.x - 300;
			_p.y = FlxG.height / 2;
			hp--;
			_player.destroyOptions();
			_player.shield = false;
			_player.weaponType = "normal";
			GenerarVida();
			_p.updateAD(2);
			
			if (hp <= 0) {
				_p.destroy();
				iu.GameOver.visible = true;
				_cmrControl.velocity.x = 0;
				GenerarVida();
			}
			
			GrupoEnemigos.remove(_e);
			_e.destroy();
		}
	}
	
	function killPlayerLvl(_p, _e)
	{	
		if(_p.afterDeath <= 0){
			_p.x = _cmrControl.x - 300;
			_p.y = FlxG.height / 2;
			hp--;
			_player.destroyOptions();
			_player.shield = false;
			_player.weaponType = "normal";
			GenerarVida();
			_p.updateAD(2);
			
			if (hp <= 0) {
				_p.destroy();
				iu.GameOver.visible = true;
			}
		}
	}
	
	function killEnemy(_s, _e:Enemy) {
			if (_e.dstry) {
				var random:FlxRandom = new FlxRandom();
				if(random.float(0, 1) < 0.1)_powerUps.add(new PowerUp(_e.x, _e.y, _powerUps));
				iu.ActualizarScore(Reg.score + Math.floor(_e.score*Reg.scoreMult));
				GrupoEnemigos.remove(_e);
				_e.destroy();
			}
			_shots.remove(_s);
			_s.destroy();
	}
	
	function dmgShield(_s, _e:Enemy) {
			if(_e.dstry){
				GrupoEnemigos.remove(_e);
				_e.destroy();
			}			
			_s.dmg();
	}
	
	function killShot(_s, _e) {
			_shots.remove(_s);
			_s.destroy();
	}
	
	function dmgBoss(_s, _b) {
			_boss.takeDmg(1);
			iu.setHP(_boss.hp);
			_shots.remove(_s);
			_s.destroy();		
	}
	
	function takePowerUp(_p, _pu) {
		_player.pwrUp++;
		_powerUps.remove(_pu);
		_pu.destroy();
	}
	
	public function createOption() {
		var o:PlayerOption;
		var maxOptions:Int = 99;
		
		if (_player.options < maxOptions) {
			if (_player.lOption != null) {
				o = new PlayerOption(_player.lOption.x - PlayerOption.maxD, _player.lOption.y, _player.lOption, _shots);
			}
			else  o = new PlayerOption(_player.x - PlayerOption.maxD, _player.y, null, _shots);
			
			_player.lOption = o;
			_player.options++;
			add(o);	
		}
	}
}