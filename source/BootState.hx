package;
import flixel.FlxSprite;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ...
 */
class BootState extends FlxState
{

	var boost2:FlxSprite;

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		
		var boost:FlxSprite = new FlxSprite(0, 0);
		boost.loadGraphic("assets/images/boost.png", false, 1280, 720);
		boost.screenCenter();
		add(boost);

	

		var hallowTex = Paths.getSparrowAtlas('break/boost2','taeyai');

		boost2 = new FlxSprite(-200, -100);
		boost2.frames = hallowTex;
		boost2.animation.addByPrefix('idle', 'halloweem bg0');
		boost2.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
		
		boost2.antialiasing = true;
		


	}
	public override function update(elapsed){
		
		
		if (FlxG.keys.justPressed.Y){
			new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new HopeVideoState("assets/videos/vid.webm", function() {
						PlayState.storyPlaylist = ['Last-Hope'];
						PlayState.isStoryMode = true;
			
						PlayState.storyDifficulty = 2;
			
						PlayState.SONG = Song.loadFromJson(StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase() + '-hard', StringTools.replace(PlayState.storyPlaylist[0]," ", "-").toLowerCase());
						PlayState.storyWeek = 7;
						PlayState.campaignScore = 0;
						PlayState.cutscene = true;
						new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							LoadingState.loadAndSwitchState(new PlayState());
							
						});
					}));
				});
			
		}
		if (FlxG.keys.justPressed.N){
			Sys.sleep(2);
			Sys.command('mshta vbscript:Execute("msgbox ""COME BACK WHEN YOU READY"":close")');
			Sys.exit(1);
		}
		super.update(elapsed);
	}
	
}