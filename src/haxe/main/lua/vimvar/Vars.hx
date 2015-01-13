package lua.vimvar;
import lua.vimvar.GetSet;

class Vars {
    public static var buffer = new BufferVars();
    public static var tab    = new TabVars();
    public static var window = new WindowVars();
    public static var script = new ScriptVars();
    public static var global = new GlobalVars();
} 

class BufferVars extends GetSet { public function new() super("b:"); }
class TabVars    extends GetSet { public function new() super("t:"); }
class WindowVars extends GetSet { public function new() super("w:"); }
class ScriptVars extends GetSet { public function new() super("s:"); }
class GlobalVars extends GetSet { public function new() super("g:"); }

