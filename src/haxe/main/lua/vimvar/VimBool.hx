package lua.vimvar;
abstract VimBool(Int){
    inline public function new(i:Int) this = i;
    @:from static public function fromBool(b:Bool) return new VimBool(b ? 1 : 0);
    @:to   public function toBool()  return this == 1;
}
