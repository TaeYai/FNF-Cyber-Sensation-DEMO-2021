package;
import flixel.FlxSprite;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import sys.FileSystem;
import sys.io.File;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class CloseState extends PlayState
{

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		
		//var warning:FlxSprite = new FlxSprite(0, 0);
		//warning.loadGraphic("assets/images/SEZ_WARN.png", false, 1280, 720);
		//add(warning);
	}
	public override function update(elapsed){
		TitleState.comehere = true;
		FlxG.save.data.reset = true;
		Sys.sleep(2);
		if (PlayState.streamer == true){
			Sys.command('mshta vbscript:Execute("msgbox ""OBS OPEN? Huh COME AGAIN WHEN YOU READY."":close")');
			Sys.command("start assets/taeyai/images/break/streamer.txt");
		}
		else
			{
				Sys.command('mshta vbscript:Execute("msgbox ""COME WHEN YOU READY."":close")');
				Sys.command("start assets/taeyai/images/break/read.txt");
			}
		
		
		Sys.exit(1);
		super.update(elapsed);
	}
	
}