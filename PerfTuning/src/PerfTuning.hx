import openfl.display.Sprite;
import game.GameState;
import game.Object;
import perf.*;

using Lambda;

interface Sprites
{
    function exists(object:Object):Bool;
    function get(object:Object):Sprite;
    function set(object:Object, sprite:Sprite):Void;
    function remove(object:Object):Void;
    function iterate(fn:Object -> Sprite -> Void):Void;
}

class PerfTuning {

    public static inline function createSprites():Sprites
    {
        return new SpritesTake1();
    }

    public static inline function isAlive(object:Object, state:GameState):Bool
    {
        return isAliveTake2(object, state);
    }

    /* PerfTuning_obj::isAlive	2257 (34,08%)	0 (0,00%)	Haxe.exe*/
    public static function isAliveOriginal(object:Object, state:GameState):Bool
    {
        return state.objects.exists(function(obj) return obj == object);
    }

    /* PerfTuning_obj::isAliveTake1	498 (9,87%)	63 (1,25%)	Haxe.exe */
    public static function isAliveTake1(object:Object, state:GameState):Bool
    {
        for (dataObject in state.objects) {
            if (dataObject == object)
                return true;
        }
        return false;
    }

    /*  PerfTuning_obj::isAliveTake2	135 (2,49%)	77 (1,42%)	Haxe.exe */
    public static function isAliveTake2(object:Object, state:GameState):Bool
    {
        for (dataObject in state.objects) {
            if (untyped __cpp__("dataObject == object"))
                return true;
        }
        return false;
    }
}