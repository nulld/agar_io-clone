package perf;

import PerfTuning.Sprites;
import game.Object;
import openfl.display.Sprite;

class SpritesOriginal implements Sprites {
    var sprites = new Map();

    public function new() {}


    public function exists(object:Object):Bool {
        return sprites.exists(object);
    }

    public function set(object:Object, sprite:Sprite):Void {
        sprites.set(object, sprite);
    }

    public function get(object:Object):Sprite {
        return sprites.get(object);
    }

    /* perf::SpritesOriginal_obj::iterate	+69	+331 480	140	672 904	Haxe.exe */
    public function iterate(fn:Object -> Sprite -> Void):Void {
        for (object in sprites.keys()) {
            fn(object, sprites.get(object));
		}
    }

    public function remove(object:Object):Void {
        sprites.remove(object);
    }
}
