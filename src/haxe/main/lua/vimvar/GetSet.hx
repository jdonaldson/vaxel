package lua.vimvar;


class GetSet implements Dynamic<Dynamic> {
    var prefix : String;
    public function new(prefix:String) {
        untyped __lua__("
            local mt = {}
            
            mt.__index = function(self, key) 
              if self._props[key] ~= nil then
                return self._props[key]
              else
                return vim.eval(prefix .. key)
              end
            end

            
            mt.__newindex = function(self, key, value)
              if self._props[key] ~= nil then
                self._props[key] = value
              else
                 if type(value) == 'string' then
                   value = \"'\"..value..\"'\"
                 elseif type(value) == 'table' then 
		           value = \"'\" .. haxe_format_JsonPrinter_JsonPrinter.print(setmetatable(value,Object), nil, nil) .. \"'\"
                 end
                 vim.command('let '  .. prefix ..  key .. ' = ' .. value)
              end
            end

            self._props = {}
            local old = getmetatable(self)
            old.__index = mt.__index
            old.__newindex = mt.__newindex
        ");
    }
}
