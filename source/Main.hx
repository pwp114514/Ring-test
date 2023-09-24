import openfl.display.Sprite;
import openfl.Assets;
import flixel.FlxGame;

class Main extends Sprite {
    public function new() {
        super();
        
        var game = {
		width: 1280, // WINDOW width
		height: 720, // WINDOW height
		framerate: 120, // default framerate
		skipSplash: true, // if the default flixel splash screen should be skipped
		startFullscreen: false // if the game should start at fullscreen mode
	    };
        // 将圆环形状添加到舞台上
        addChild(new FlxGame(game.width, game.height, PlayState, game.framerate, game.framerate, game.skipSplash, game.startFullscreen));
    }
}
