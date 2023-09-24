import openfl.display.Sprite;
import openfl.geom.Circle;
import openfl.Assets;

class Main extends Sprite {
    public function new() {
        super();

        // 创建圆环形状
        var ringShape = new Circle(50); // 圆环的半径为50像素

        // 设置圆环颜色
        ringShape.color = 0xFF0000; // 红色

        // 设置线宽
        ringShape.thickness = 10; // 线宽为10像素

        // 将圆环形状添加到舞台上
        addChild(ringShape);
    }
}
