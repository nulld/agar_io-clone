package perf;

import PerfTuning.Sprites;
import game.Object;
import openfl.display.Sprite;

class SpritesTake1 implements Sprites {
    var sprites = new Map();
    var keys = [];
    var keysCount = 0;

    public function new() {}


    public function exists(object:Object):Bool {
        return sprites.exists(object);
    }

    public function set(object:Object, sprite:Sprite):Void {
        keys[keysCount++] = object;
        sprites.set(object, sprite);
    }

    public function get(object:Object):Sprite {
        return sprites.get(object);
    }

    /*perf::SpritesTake1_obj::exists	+18	+576	31	992	Haxe.exe */
    public function iterate(fn:Object -> Sprite -> Void):Void {
        for (i in 0...keysCount) {
            var object = keys[i];
            fn(object, sprites.get(object));
		}
    }

    public function remove(object:Object):Void {
        var index = keys.indexOf(object);
        if (index < keysCount - 1)
        {
            swap(index, keysCount - 1);
        }
        keys[keysCount] = null;
        keysCount--;

        sprites.remove(object);
    }

    function swap(i1, i2):Void
    {
        var o1 = keys[i1];
        var o2 = keys[i2];
        keys[i1] = o2;
        keys[i2] = o1;
    }
}