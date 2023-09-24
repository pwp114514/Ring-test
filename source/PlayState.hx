import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import flixel.graphics.FlxGraphic;
import flixel.graphics.atlas.FlxNode;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxTileFrames;
import flixel.graphics.frames.FlxFrame;

class Main extends flixel.FlxGame
{
    public function new()
    {
        super(320, 240, PlayState);
    }
}

class PlayState extends flixel.FlxState
{
    public override function create():Void
    {
        // 创建圆环的外部圆
        var outerRadius:Float = 80;
        var outerCircle:FlxGraphic = createCircle(outerRadius, 0xFF00FF00);
        FlxG.draw.begin();
        FlxG.draw.graphics.beginBitmapFill(outerCircle.bitmap);
        FlxG.draw.graphics.drawTriangles(outerCircle.data, outerCircle.indices);
        FlxG.draw.end();

        // 创建圆环的内部圆
        var innerRadius:Float = 40;
        var innerCircle:FlxGraphic = createCircle(innerRadius, 0xFF0000FF);
        FlxG.draw.begin();
        FlxG.draw.graphics.beginBitmapFill(innerCircle.bitmap);
        FlxG.draw.graphics.drawTriangles(innerCircle.data, innerCircle.indices);
        FlxG.draw.end();
    }

    private function createCircle(radius:Float, color:Int):FlxGraphic
    {
        var textureSize:Int = Math.ceil(radius * 2);
        var center:FlxPoint = new FlxPoint(radius, radius);

        var atlas:FlxAtlas = new FlxAtlas(null, null, null, null, textureSize, textureSize);
        var nodeId:Int = atlas.addNode(center.x, center.y, textureSize, textureSize);
        var node:FlxNode = atlas.getNodeWithIndex(nodeId).setColor(color);

        var frames:FlxTileFrames = new FlxTileFrames(atlas, 1, 1);
        frames.add(new FlxFrame(nodeId));

        var graphic:FlxGraphic = new FlxGraphic(frames, textureSize, textureSize);
        FlxSpriteUtil.fill(graphic, 0x00FFFFFF); // 使圆变透明

        return graphic;
    }
}
