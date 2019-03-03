package perf;

import openfl.display.Sprite;
import game.Object;

interface Sprites
{
    function exists(object:Object):Bool;
    function get(object:Object):Sprite;
    function set(object:Object, sprite:Sprite):Void;
    function remove(object:Object):Void;
    function iterate(fn:Object -> Sprite -> Void):Void;
}