package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y25:assets%2Fdata%2FLevel.oelR2i19742R3R4R5R7R6tgoR0y27:assets%2Fdata%2FLevel01.oelR2i28815R3R4R5R8R6tgoR0y28:assets%2Fdata%2Fleveling.oelR2i16701R3R4R5R9R6tgoR0y27:assets%2Fdata%2Flevelpr.oelR2i3615R3R4R5R10R6tgoR0y28:assets%2Fdata%2FProyecto.oepR2i4814R3R4R5R11R6tgoR0y35:assets%2Fdata%2FUnsaved%20Level.oelR2i7699R3R4R5R12R6tgoR0y24:assets%2Fimages%2Fbg.pngR2i1776R3y5:IMAGER5R13R6tgoR0y24:assets%2Fimages%2Fbg.psdR2i115810R3y6:BINARYR5R15R6tgoR0y25:assets%2Fimages%2Fbg0.pngR2i66634R3R14R5R17R6tgoR0y25:assets%2Fimages%2Fbg1.pngR2i2010R3R14R5R18R6tgoR0y25:assets%2Fimages%2Fbg2.pngR2i1958R3R14R5R19R6tgoR0y26:assets%2Fimages%2Fboss.pngR2i13447R3R14R5R20R6tgoR0y27:assets%2Fimages%2Fboss2.pngR2i2240R3R14R5R21R6tgoR0y25:assets%2Fimages%2FCop.pngR2i18850R3R14R5R22R6tgoR0y24:assets%2Fimages%2Fcs.pngR2i2827R3R14R5R23R6tgoR0y28:assets%2Fimages%2Fending.pngR2i66252R3R14R5R24R6tgoR0y27:assets%2Fimages%2Fenemy.pngR2i4952R3R14R5R25R6tgoR0y28:assets%2Fimages%2Fenemy1.pngR2i947R3R14R5R26R6tgoR0y28:assets%2Fimages%2Fenemy2.pngR2i971R3R14R5R27R6tgoR0y28:assets%2Fimages%2Fenemy3.pngR2i790R3R14R5R28R6tgoR0y33:assets%2Fimages%2FenemyBullet.pngR2i563R3R14R5R29R6tgoR0y28:assets%2Fimages%2Fhealth.pngR2i3234R3R14R5R30R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R31R6tgoR0y29:assets%2Fimages%2Fmissile.pngR2i3137R3R14R5R32R6tgoR0y28:assets%2Fimages%2Fplayer.psdR2i24634R3R16R5R33R6tgoR0y27:assets%2Fimages%2Fstars.pngR2i14968R3R14R5R34R6tgoR0y27:assets%2Fimages%2Ftiles.pngR2i1056R3R14R5R35R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i42902R3R14R5R36R6tgoR0y25:assets%2Fmusic%2FMENU.sfkR2i408496R3R16R5R37R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R38R6tgoR2i39814R3y5:SOUNDR5y26:assets%2Fsounds%2Fkill.wavy9:pathGroupaR40hR6tgoR2i17858R3R39R5y27:assets%2Fsounds%2Flaser.wavR41aR42hR6tgoR2i53438R3R39R5y28:assets%2Fsounds%2Fmisile.wavR41aR43hR6tgoR2i21872R3R39R5y32:assets%2Fsounds%2Fnormalshot.wavR41aR44hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R45R6tgoR0y33:assets%2Fsounds%2Fsrc%2Flaser.sfsR2i105R3R16R5R46R6tgoR0y35:assets%2Fsounds%2Fsrc%2Fmissile.sfsR2i105R3R16R5R47R6tgoR0y36:assets%2Fsounds%2Fsrc%2Fmissile2.sfsR2i105R3R16R5R48R6tgoR0y33:assets%2Fsounds%2Fsrc%2Fshot1.sfsR2i105R3R16R5R49R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R41aR51y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R50R5y28:flixel%2Fsounds%2Fflixel.mp3R41aR53y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R39R5R52R41aR51R52hgoR2i33629R3R39R5R54R41aR53R54hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R55R56y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R14R5R61R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R14R5R62R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level01_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_leveling_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_levelpr_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_proyecto_oep extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_unsaved_level_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bg2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemybullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_missile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_stars_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_menu_sfk extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_kill_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_laser_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_misile_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_normalshot_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_src_laser_sfs extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_src_missile_sfs extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_src_missile2_sfs extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_src_shot1_sfs extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/Level.oel") @:noCompletion #if display private #end class __ASSET__assets_data_level_oel extends haxe.io.Bytes {}
@:keep @:file("assets/data/Level01.oel") @:noCompletion #if display private #end class __ASSET__assets_data_level01_oel extends haxe.io.Bytes {}
@:keep @:file("assets/data/leveling.oel") @:noCompletion #if display private #end class __ASSET__assets_data_leveling_oel extends haxe.io.Bytes {}
@:keep @:file("assets/data/levelpr.oel") @:noCompletion #if display private #end class __ASSET__assets_data_levelpr_oel extends haxe.io.Bytes {}
@:keep @:file("assets/data/Proyecto.oep") @:noCompletion #if display private #end class __ASSET__assets_data_proyecto_oep extends haxe.io.Bytes {}
@:keep @:file("assets/data/Unsaved Level.oel") @:noCompletion #if display private #end class __ASSET__assets_data_unsaved_level_oel extends haxe.io.Bytes {}
@:keep @:image("assets/images/bg.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/images/bg.psd") @:noCompletion #if display private #end class __ASSET__assets_images_bg_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/bg0.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg1.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bg2.png") @:noCompletion #if display private #end class __ASSET__assets_images_bg2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_png extends lime.graphics.Image {}
@:keep @:image("assets/images/boss2.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Cop.png") @:noCompletion #if display private #end class __ASSET__assets_images_cop_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cs.png") @:noCompletion #if display private #end class __ASSET__assets_images_cs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ending.png") @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy1.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy2.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemy3.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemyBullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemybullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/health.png") @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/missile.png") @:noCompletion #if display private #end class __ASSET__assets_images_missile_png extends lime.graphics.Image {}
@:keep @:file("assets/images/player.psd") @:noCompletion #if display private #end class __ASSET__assets_images_player_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/stars.png") @:noCompletion #if display private #end class __ASSET__assets_images_stars_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:file("assets/music/MENU.sfk") @:noCompletion #if display private #end class __ASSET__assets_music_menu_sfk extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/kill.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_kill_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/laser.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_laser_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/misile.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_misile_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/normalshot.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_normalshot_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/src/laser.sfs") @:noCompletion #if display private #end class __ASSET__assets_sounds_src_laser_sfs extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/src/missile.sfs") @:noCompletion #if display private #end class __ASSET__assets_sounds_src_missile_sfs extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/src/missile2.sfs") @:noCompletion #if display private #end class __ASSET__assets_sounds_src_missile2_sfs extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/src/shot1.sfs") @:noCompletion #if display private #end class __ASSET__assets_sounds_src_shot1_sfs extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/Users/Admin/Downloads/Arkanoid/Arkanoid/flixel-tools/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end

#end