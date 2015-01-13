
function exec()

Array_Array = {};
___inherit(Array_Array, Object);
Array_Array.__name__ = "Array_Array";
Array_Array.__index = Array_Array;
	
	function Array_Array.new(arg)
		local self = setmetatable({ }, Array_Array)
		if(arg)then return setmetatable(arg or{},Array_Array)end
		return self
	end
	
	function Array_Array:super(arg)
		if(arg)then return setmetatable(arg or{},Array_Array)end
	end
	function Array_Array.__tostring(a)
		return a:toString();
	end
	
	function Array_Array:get_length()
		local len = 0
		for k in pairs(self) do
			len = math.max(len, k+1)
		end
		return len;
	end
	
	function Array_Array:concat(a)
		local result = {}
		for k,v in pairs(self) do
			result[k] = v
		end
    	for i=0,#a do
    	    result[#result+1] = a[i]
    	end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:copy()
		local result = {}
		for k,v in pairs(self) do
			result[k] = v
		end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:iterator()
		local result = setmetatable({  },Object)
		result.cur = 0
		result.arr = self
		result.hasNext = function()
			return result.arr[result.cur] ~= nil;
		end
		result.next = function()
			result.cur = result.cur + 1;
			return result.arr[result.cur - 1];
		end
		return result;
	end
	
	function Array_Array:insert(pos, x)
		local len = self:get_length()
		local _g1 = -1
		local _g = len - pos
		while (_g1 < _g) do
			local i = _g1; _g1 = _g1 + 1
			self[len - i] = self[len - i - 1]
		end
		self[pos] = x
	end
	
	function Array_Array:join(sep)
		local t = {}
		for i=0, #self do
			t[i] = tostring(self[i] or "")
		end
		return table.concat(t, sep, 0);
	end
	
	function Array_Array:toString()
		local s = "[ "
		function prv(v)
    		s = s + v
    	end
    	local first = true
    	for key, value in pairs (self) do
    		prv(first and value or (", " + value))
    		first = false
    	end
		return s + " ]";
	end
	
	function Array_Array:pop()
		local length = #self
		local last = self[length]
		self[length] = nil
		return last;
	end
	
	function Array_Array:push(elem)
		local length = #self
		if (self[0]) then
			length = length + 1
		end
		self[length] = elem
		return length;
	end
	
	function Array_Array:unshift(x)
		local len = self:get_length()
		local _g = 0
		while (_g < len) do
			local i = _g; _g = _g + 1
			self[len - i] = self[len - i - 1]
		end
		self[0] = x
	end
	
	function Array_Array:indexOf(x, fromIndex)
		if (fromIndex == nil) then
			fromIndex = 0
		end
		local _g1 = fromIndex
		local _g = self:get_length()
		while (_g1 < _g) do
			local i = _g1; _g1 = _g1 + 1
			if (x == self[i]) then
				return i
			end
		end
		return -1;
	end
	
	function Array_Array:lastIndexOf(x, fromIndex)
		if (fromIndex == nil) then
			fromIndex = self:get_length()
		end
		local _g = 0
		while (_g < fromIndex) do
			local i = _g; _g = _g + 1
			if (x == self[fromIndex - i]) then
				return fromIndex - i
			end
		end
		return -1;
	end
	
	function Array_Array:remove(x)
		local result = self:indexOf(x)
		if (result == -1) then
			return false
		else
			local len = self:get_length()
			local _g1 = result
			local _g = len - 1
			while (_g1 < _g) do
				local i = _g1; _g1 = _g1 + 1
				self[i] = self[i + 1]
			end
			self[len] = nil
			return true;
		end
	end
	
	function Array_Array:reverse()
		local length = #self
		if(length < 2) then return end
		for i = 0,length/2,1 do
			local temp = self[i]
			self[i] = self[length-i]
			self[length-i] = temp
		end
	end
	
	function Array_Array:shift()
		local result = self[0]
		local len = self:get_length()
		local _g = 0
		while (_g < len) do
			local i = _g; _g = _g + 1
			self[i] = self[i + 1]
		end
		self[len - 2] = nil
		return result;
	end
	
	function Array_Array:slice(pos, ends)
		local result = {}
		for i = pos,(ends or #self)-1 do
			result[i] = self[i]
		end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:sort(fun)
		local isSorted = false
		while isSorted == false do
			movedElements = 0
			for x = 0, table.getn(self) - 1, 1 do
				if fun(self[x], self[x + 1]) > 0 then
					movedElements = movedElements + 1
					testedElement = self[x]
					self[x] = self[x + 1]
					self[x + 1] = testedElement
				end
			end
			if movedElements == 0 then
				isSorted = true
			end
		end
	end
	
	function Array_Array:splice(a, b)
		local result = {}
		for i = a,b do
			result[i] = self[i]
		end
		for i = a,b-a do
			self[i] = self[i+a+1]
		end
		for i = b,table.getn(self) do
			self[i] = nil
		end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:pairs()
		return pairs(self);
	end
	
	function Array_Array:map(f)
		local result = {}
		for k,v in pairs(self) do result[k] = f(v) end
		return setmetatable(result, Array_Array);
	end
	
	function Array_Array:filter(f)
		local result = setmetatable({}, Array_Array)
		local _g = 0
		local _g1 = self
		while (_g < _g1:get_length()) do
			local i = _g1[_g]
			_g = _g + 1;
			if (f(i)) then
				result:push(i)
			end
		end
		return result;
	end
	
	
Array_Array.__props__ = {"get_length"};


Main_Main = {};
___inherit(Main_Main, Object);
Main_Main.__name__ = "Main_Main";
Main_Main.__index = Main_Main;
	function Main_Main.main()
		_G.print("Main.hx:6: " + (lua_vimvar_Options_Options.options.aleph))
	end
	
Main_Main.__props__ = {};


Type_ValueType = {__super__ = Enum}

Type_ValueType.new = function(tag,index,params) return setmetatable({
	[0] = params[0],
	[1] = index,
	tag = tag,
	index = index,
	params = params
},Enum) end

Type_ValueType.TClass = function(_,c) return Type_ValueType.new("TClass", 6, {[0]=c}); end
Type_ValueType.TNull = setmetatable({[0]="TNull", [1]=0},Enum);
Type_ValueType.TObject = setmetatable({[0]="TObject", [1]=4},Enum);
Type_ValueType.TFunction = setmetatable({[0]="TFunction", [1]=5},Enum);
Type_ValueType.TInt = setmetatable({[0]="TInt", [1]=1},Enum);
Type_ValueType.TUnknown = setmetatable({[0]="TUnknown", [1]=8},Enum);
Type_ValueType.TEnum = function(_,e) return Type_ValueType.new("TEnum", 7, {[0]=e}); end
Type_ValueType.TFloat = setmetatable({[0]="TFloat", [1]=2},Enum);
Type_ValueType.TBool = setmetatable({[0]="TBool", [1]=3},Enum);


Type_Type = {};
___inherit(Type_Type, Object);
Type_Type.__name__ = "Type_Type";
Type_Type.__index = Type_Type;
	function Type_Type.getSuperClass(c)
		return c.__super__;
	end
	function Type_Type.getClassName(c)
		return c.__name__;
	end
	function Type_Type.resolveClass(name)
		local cl = ___hxClasses[name]
		if (cl == nil) then
			return nil
		end
		return cl;
	end
	function Type_Type.createEmptyInstance(cl)
		return nil;
	end
	function Type_Type.allEnums(e)
		return nil;
	end
	function Type_Type.createEnum(e, constr, params)
		return nil;
	end
	function Type_Type.createEnumIndex(e, index, params)
		return nil;
	end
	function Type_Type.createInstance(cl, args)
		return nil;
	end
	function Type_Type.enumConstructor(e)
		return nil;
	end
	function Type_Type.enumEq(a, b)
		return nil;
	end
	function Type_Type.enumIndex(e)
		return e[1];
	end
	function Type_Type.enumParameters(e)
		return nil;
	end
	function Type_Type.getClass(o)
		return nil;
	end
	function Type_Type.getClassFields(c)
		return nil;
	end
	function Type_Type.getEnum(o)
		return nil;
	end
	function Type_Type.getEnumConstructs(e)
		return nil;
	end
	function Type_Type.getEnumName(e)
		return nil;
	end
	function Type_Type.getInstanceFields(c)
		return nil;
	end
	function Type_Type.resolveEnum(name)
		return nil;
	end
	function Type_Type.typeof(v)
		if (v == nil) then
			return Type_ValueType.TNull
		end
		local t = type(v)
		if (t == "string") then
			return Type_ValueType:TClass(String_String)
		else
			if (t == "boolean") then
				return Type_ValueType.TBool
			else
				if (t == "number") then
					local try, catch = pcall(function ()
						local f = math.modf
						local i = f(v)
						if (i == v) then
							return Type_ValueType.TInt
						end
						return undefined
					end);--
					if (try == false) then
						local e = catch;
						_G.print("Type.hx:127: " + (e))
					elseif (catch ~= undefined) then return catch end
					return Type_ValueType.TFloat;
				else
					if (t == "function") then
						return Type_ValueType.TFunction
					else
						if (t == "table") then
							local mt = luaxe_Lua_Lua.getmetatable(v)
							if (mt == Object) then
								return Type_ValueType.TObject
							else
								return Type_ValueType:TClass(mt)
							end
						end
					end
				end
			end
		end
		return Type_ValueType.TUnknown;
	end
	
Type_Type.__props__ = {};


lua_vimvar_GetSet_GetSet = {};
___inherit(lua_vimvar_GetSet_GetSet, Object);
lua_vimvar_GetSet_GetSet.__name__ = "lua.vimvar.GetSet_GetSet";
lua_vimvar_GetSet_GetSet.__index = lua_vimvar_GetSet_GetSet;
	
	function lua_vimvar_GetSet_GetSet.new(prefix)
		local self = setmetatable({ }, lua_vimvar_GetSet_GetSet)
		
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
                   value = "'"..value.."'"
                 elseif type(value) == 'table' then 
		           value = "'" .. haxe_format_JsonPrinter_JsonPrinter.print(setmetatable(value,Object), nil, nil) .. "'"
                 end
                 vim.command('let '  .. prefix ..  key .. ' = ' .. value)
              end
            end

            self._props = {}
            local old = getmetatable(self)
            old.__index = mt.__index
            old.__newindex = mt.__newindex
        
		return self
	end
	
	function lua_vimvar_GetSet_GetSet:super(prefix)
		
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
                   value = "'"..value.."'"
                 elseif type(value) == 'table' then 
		           value = "'" .. haxe_format_JsonPrinter_JsonPrinter.print(setmetatable(value,Object), nil, nil) .. "'"
                 end
                 vim.command('let '  .. prefix ..  key .. ' = ' .. value)
              end
            end

            self._props = {}
            local old = getmetatable(self)
            old.__index = mt.__index
            old.__newindex = mt.__newindex
        
	end
	
	
lua_vimvar_GetSet_GetSet.__props__ = {};


lua_vimvar_Options_Option = {};
___inherit(lua_vimvar_Options_Option, lua_vimvar_GetSet_GetSet);
lua_vimvar_Options_Option.__name__ = "lua.vimvar.Options_Option";
lua_vimvar_Options_Option.__index = lua_vimvar_Options_Option;
	
	function lua_vimvar_Options_Option.new(prefix)
		local self = setmetatable({ }, lua_vimvar_Options_Option)
		lua_vimvar_GetSet_GetSet.super(self, ((prefix == nil) and "&" or (prefix)))
		return self
	end
	
	function lua_vimvar_Options_Option:super(prefix)
		lua_vimvar_GetSet_GetSet.super(self, ((prefix == nil) and "&" or (prefix)))
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
lua_vimvar_Options_Option.__props__ = {};


lua_vimvar_Options_GlobalOption = {};
___inherit(lua_vimvar_Options_GlobalOption, lua_vimvar_Options_Option);
lua_vimvar_Options_GlobalOption.__name__ = "lua.vimvar.Options_GlobalOption";
lua_vimvar_Options_GlobalOption.__index = lua_vimvar_Options_GlobalOption;
	
	function lua_vimvar_Options_GlobalOption.new(prefix)
		local self = setmetatable({ }, lua_vimvar_Options_GlobalOption)
		lua_vimvar_Options_Option.super(self, ((prefix == nil) and "&g:" or (prefix)))
		return self
	end
	
	function lua_vimvar_Options_GlobalOption:super(prefix)
		lua_vimvar_Options_Option.super(self, ((prefix == nil) and "&g:" or (prefix)))
	end
	
lua_vimvar_Options_GlobalOption.__props__ = {};


lua_vimvar_Options_LocalOption = {};
___inherit(lua_vimvar_Options_LocalOption, lua_vimvar_Options_Option);
lua_vimvar_Options_LocalOption.__name__ = "lua.vimvar.Options_LocalOption";
lua_vimvar_Options_LocalOption.__index = lua_vimvar_Options_LocalOption;
	
	function lua_vimvar_Options_LocalOption.new(prefix)
		local self = setmetatable({ }, lua_vimvar_Options_LocalOption)
		lua_vimvar_Options_Option.super(self, ((prefix == nil) and "&l:" or (prefix)))
		return self
	end
	
	function lua_vimvar_Options_LocalOption:super(prefix)
		lua_vimvar_Options_Option.super(self, ((prefix == nil) and "&l:" or (prefix)))
	end
	
lua_vimvar_Options_LocalOption.__props__ = {};


lua_vimvar_Options_Options = {};
___inherit(lua_vimvar_Options_Options, Object);
lua_vimvar_Options_Options.__name__ = "lua.vimvar.Options_Options";
lua_vimvar_Options_Options.__index = lua_vimvar_Options_Options;
	lua_vimvar_Options_Options.options = lua_vimvar_Options_Option.new();
	lua_vimvar_Options_Options.locals = lua_vimvar_Options_LocalOption.new();
	lua_vimvar_Options_Options.globals = lua_vimvar_Options_GlobalOption.new();
	
lua_vimvar_Options_Options.__props__ = {};


lua_vimvar_Vars_BufferVars = {};
___inherit(lua_vimvar_Vars_BufferVars, lua_vimvar_GetSet_GetSet);
lua_vimvar_Vars_BufferVars.__name__ = "lua.vimvar.Vars_BufferVars";
lua_vimvar_Vars_BufferVars.__index = lua_vimvar_Vars_BufferVars;
	
	function lua_vimvar_Vars_BufferVars.new()
		local self = setmetatable({ }, lua_vimvar_Vars_BufferVars)
		lua_vimvar_GetSet_GetSet.super(self, "b:")
		return self
	end
	
	function lua_vimvar_Vars_BufferVars:super()
		lua_vimvar_GetSet_GetSet.super(self, "b:")
	end
	
lua_vimvar_Vars_BufferVars.__props__ = {};


lua_vimvar_Vars_GlobalVars = {};
___inherit(lua_vimvar_Vars_GlobalVars, lua_vimvar_GetSet_GetSet);
lua_vimvar_Vars_GlobalVars.__name__ = "lua.vimvar.Vars_GlobalVars";
lua_vimvar_Vars_GlobalVars.__index = lua_vimvar_Vars_GlobalVars;
	
	function lua_vimvar_Vars_GlobalVars.new()
		local self = setmetatable({ }, lua_vimvar_Vars_GlobalVars)
		lua_vimvar_GetSet_GetSet.super(self, "g:")
		return self
	end
	
	function lua_vimvar_Vars_GlobalVars:super()
		lua_vimvar_GetSet_GetSet.super(self, "g:")
	end
	
lua_vimvar_Vars_GlobalVars.__props__ = {};


lua_vimvar_Vars_ScriptVars = {};
___inherit(lua_vimvar_Vars_ScriptVars, lua_vimvar_GetSet_GetSet);
lua_vimvar_Vars_ScriptVars.__name__ = "lua.vimvar.Vars_ScriptVars";
lua_vimvar_Vars_ScriptVars.__index = lua_vimvar_Vars_ScriptVars;
	
	function lua_vimvar_Vars_ScriptVars.new()
		local self = setmetatable({ }, lua_vimvar_Vars_ScriptVars)
		lua_vimvar_GetSet_GetSet.super(self, "s:")
		return self
	end
	
	function lua_vimvar_Vars_ScriptVars:super()
		lua_vimvar_GetSet_GetSet.super(self, "s:")
	end
	
lua_vimvar_Vars_ScriptVars.__props__ = {};


lua_vimvar_Vars_TabVars = {};
___inherit(lua_vimvar_Vars_TabVars, lua_vimvar_GetSet_GetSet);
lua_vimvar_Vars_TabVars.__name__ = "lua.vimvar.Vars_TabVars";
lua_vimvar_Vars_TabVars.__index = lua_vimvar_Vars_TabVars;
	
	function lua_vimvar_Vars_TabVars.new()
		local self = setmetatable({ }, lua_vimvar_Vars_TabVars)
		lua_vimvar_GetSet_GetSet.super(self, "t:")
		return self
	end
	
	function lua_vimvar_Vars_TabVars:super()
		lua_vimvar_GetSet_GetSet.super(self, "t:")
	end
	
lua_vimvar_Vars_TabVars.__props__ = {};


lua_vimvar_Vars_WindowVars = {};
___inherit(lua_vimvar_Vars_WindowVars, lua_vimvar_GetSet_GetSet);
lua_vimvar_Vars_WindowVars.__name__ = "lua.vimvar.Vars_WindowVars";
lua_vimvar_Vars_WindowVars.__index = lua_vimvar_Vars_WindowVars;
	
	function lua_vimvar_Vars_WindowVars.new()
		local self = setmetatable({ }, lua_vimvar_Vars_WindowVars)
		lua_vimvar_GetSet_GetSet.super(self, "w:")
		return self
	end
	
	function lua_vimvar_Vars_WindowVars:super()
		lua_vimvar_GetSet_GetSet.super(self, "w:")
	end
	
lua_vimvar_Vars_WindowVars.__props__ = {};


lua_vimvar_Vars_Vars = {};
___inherit(lua_vimvar_Vars_Vars, Object);
lua_vimvar_Vars_Vars.__name__ = "lua.vimvar.Vars_Vars";
lua_vimvar_Vars_Vars.__index = lua_vimvar_Vars_Vars;
	lua_vimvar_Vars_Vars.buffer = lua_vimvar_Vars_BufferVars.new();
	lua_vimvar_Vars_Vars.tab = lua_vimvar_Vars_TabVars.new();
	lua_vimvar_Vars_Vars.window = lua_vimvar_Vars_WindowVars.new();
	lua_vimvar_Vars_Vars.script = lua_vimvar_Vars_ScriptVars.new();
	lua_vimvar_Vars_Vars.global = lua_vimvar_Vars_GlobalVars.new();
	
lua_vimvar_Vars_Vars.__props__ = {};


lua_vimvar_VimBool_VimBool_Impl_ = {};
___inherit(lua_vimvar_VimBool_VimBool_Impl_, Object);
lua_vimvar_VimBool_VimBool_Impl_.__name__ = "lua.vimvar.VimBool_VimBool_Impl_";
lua_vimvar_VimBool_VimBool_Impl_.__index = lua_vimvar_VimBool_VimBool_Impl_;
	function lua_vimvar_VimBool_VimBool_Impl_._new(i)
		return i;
	end
	function lua_vimvar_VimBool_VimBool_Impl_.fromBool(b)
		if (b) then
			return 1
		else
			return 0
		end
	end
	function lua_vimvar_VimBool_VimBool_Impl_.toBool(this1)
		return this1 == 1;
	end
	
lua_vimvar_VimBool_VimBool_Impl_.__props__ = {};


luaxe_Lua_Lua = {};
___inherit(luaxe_Lua_Lua, Object);
luaxe_Lua_Lua.__name__ = "luaxe.Lua_Lua";
luaxe_Lua_Lua.__index = luaxe_Lua_Lua;
	function luaxe_Lua_Lua.eval(code)
		return _G.dostring(code);
	end
	function luaxe_Lua_Lua.var_setmetatable(obj, mt)
		return setmetatable(obj, mt);
	end
	function luaxe_Lua_Lua.setmetatabledef(obj, mt)
		return setmetatable(obj, mt);
	end
	function luaxe_Lua_Lua.getmetatable(obj)
		return getmetatable(obj);
	end
	function luaxe_Lua_Lua.hash(obj)
		return #obj;
	end
	
luaxe_Lua_Lua.__props__ = {};


luaxe_Lua_LuaArray_Impl_ = {};
___inherit(luaxe_Lua_LuaArray_Impl_, Object);
luaxe_Lua_LuaArray_Impl_.__name__ = "luaxe.Lua_LuaArray_Impl_";
luaxe_Lua_LuaArray_Impl_.__index = luaxe_Lua_LuaArray_Impl_;
	function luaxe_Lua_LuaArray_Impl_._new()
		local this1
		this1 = {}
		return this1;
	end
	function luaxe_Lua_LuaArray_Impl_.getFromOne(this1, k)
		return this1[k + 1];
	end
	function luaxe_Lua_LuaArray_Impl_.arrayWriteFromOne(this1, k, v)
		this1[k + 1] = v
	end
	
	function luaxe_Lua_LuaArray_Impl_.get_length(this1)
		return #this1;
	end
	
luaxe_Lua_LuaArray_Impl_.__props__ = {};


end
___hxClasses = {Array_Array = Array_Array,Main_Main = Main_Main,Type_Type = Type_Type,lua_vimvar_GetSet_GetSet = lua_vimvar_GetSet_GetSet,lua_vimvar_Options_Option = lua_vimvar_Options_Option,lua_vimvar_Options_GlobalOption = lua_vimvar_Options_GlobalOption,lua_vimvar_Options_LocalOption = lua_vimvar_Options_LocalOption,lua_vimvar_Options_Options = lua_vimvar_Options_Options,lua_vimvar_Vars_BufferVars = lua_vimvar_Vars_BufferVars,lua_vimvar_Vars_GlobalVars = lua_vimvar_Vars_GlobalVars,lua_vimvar_Vars_ScriptVars = lua_vimvar_Vars_ScriptVars,lua_vimvar_Vars_TabVars = lua_vimvar_Vars_TabVars,lua_vimvar_Vars_WindowVars = lua_vimvar_Vars_WindowVars,lua_vimvar_Vars_Vars = lua_vimvar_Vars_Vars,lua_vimvar_VimBool_VimBool_Impl_ = lua_vimvar_VimBool_VimBool_Impl_,luaxe_Lua_Lua = luaxe_Lua_Lua,luaxe_Lua_LuaArray_Impl_ = luaxe_Lua_LuaArray_Impl_,}
null = nil
trace = print
undefined = { } 
pcall(require, 'bit32')
pcall(require, 'bit')
if(bit == nil)then bit = bit32 end
if(bit32 == nil)then bit32 = bit end
Enum = Enum or {}
Enum_Enum = Enum_Enum or Enum
Enum.__super__ = Enum

function Enum.__tostring(e)
	return (e.tag or "") + (e.params and "(" .. table.concat(e.params, ",") .. ")" or rawget(e, 0))
end
function _G.___ternar(cond,any,elses)
	if(cond)then return any end
	return elses
end
function ___inherit(to, base)
    for k, v in pairs(base) do
        to[k] = v
    end
    to.__super__ = base
end
function __new__(obj, ...)
	return obj.new(...)
end
function __strict_eq__(obj, to)
	return (tostring(obj) == tostring(to))
end
__typeof__ = type;
haxe_Log_Log = {};
function haxe_Log_Log.trace(a, i)
	if(i and i.fileName and i.customParams)then
		print(i.fileName + ":" + i.lineNumber + ": " + a + "," + i.customParams:join(","))
	elseif(i and i.fileName)then
		print(i.fileName + ":" + i.lineNumber + ": " + a)
	else
		print(a)
		if(i) then print(i) end
	end
end
function haxe_Log_Log.clear()
end
function ___bind(o,m)
	if(not m)then return nil end;
	return function(...)
    	local result = m(o, ...);
    	return result;
 	end
end
function __Array(r)
	return setmetatable(r, Array_Array)
end
function Array()
	return __Array({})
end
if(table.getn == nil)then table.getn = function(o)return #o end end
if(loadstring == nil)then loadstring = function(o)return (function()return "" end) end end
function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  if type(tt) == "table" then
    local sb = {}
    for key, value in pairs (tt) do
      table.insert(sb, string.rep (" ", indent)) 
      if type (value) == "table" and not done [value] then
        done [value] = true
        table.insert(sb, "{\n");
        table.insert(sb, table_print (value, indent + 2, done))
        table.insert(sb, string.rep (" ", indent)) 
        table.insert(sb, "}\n");
      elseif "number" == type(key) then
        table.insert(sb, string.format("\"%s\"\n", tostring(value)))
      else
        table.insert(sb, string.format(
            "%s = \"%s\"\n", tostring (key), tostring(value)))
       end
    end
    return table.concat(sb)
  else
    return tt .. "\n"
  end
end
function to_string( tbl )
    if  "nil"       == type( tbl ) then
        return tostring(nil)
    elseif  "table" == type( tbl ) then
        return table_print(tbl)
    elseif  "string" == type( tbl ) then
        return tbl
    else
        return tostring(tbl)
    end
end
Math = {}
Math_Math = Math
function Math.round(num)
	if num >= 0 then return math.floor(num+.5) 
	 else return math.ceil(num-.5) end
end
Math.NaN = 0/0;
Math.NEGATIVE_INFINITY = -1.0 / 0.0
Math.POSITIVE_INFINITY = 1.0 / 0.0
Math.PI = math.pi
Math.random, Math.abs, Math.min, Math.max = math.random, math.abs, math.min, math.max
Math.sin, Math.cos, Math.exp, Math.log, Math.tan = math.sin, math.cos, math.exp, math.log
Math.sqrt, Math.fround, Math.ffloor, Math.fceil = math.sqrt, Math.round, math.floor, math.ceil
Math.acos, Math.asin, Math.atan, Math.atan2, Math.pow = math.acos, math.asin, math.atan, math.atan2, math.pow
function Math.floor(num)
	return Math.round(math.floor(num))
end
function Math.ceil(num)
	return Math.round(math.ceil(num))
end
function Math.isNaN(num)
	return num == Math.NaN
end
function Math.isFinite(num)
	return num ~= Math.NEGATIVE_INFINITY and num ~= Math.POSITIVE_INFINITY and num ~= Math.NaN
end
function Math.get_NaN()return Math.NaN end
function Math.get_POSITIVE_INFINITY()return Math.POSITIVE_INFINITY end
function Math.get_NEGATIVE_INFINITY()return Math.NEGATIVE_INFINITY end
String = {}
String_String = String
local __StringMeta = getmetatable('')
function __StringMeta.__add(a,b) 
  return tostring(a or (a == false and "false") or "null") .. tostring(b or (b == false and "false") or "null")
end
__StringMeta.__index = function (str, p)
	if (p == "length") then
		return string.len(str) 
	else
		return String[p]
	end
end
local __string_sub = string.sub
local __string_byte = string.byte
local __string_find = string.find
String.fromCharCode = string.char 
String.substring = string.sub 
String.toLowerCase = string.lower 
String.toUpperCase = string.upper 
function String.new(string) 
	return string
end
function String:toString() 
	return self
end
function String:charAt(index) 
	return __string_sub(self, index+1, index+1)
end
function String:charCodeAt(index) 
	return __string_byte(__string_sub(self, index+1, index+1))
end
function String:indexOf(str, startIndex) 
	local r = string.find(self, str, startIndex, true)
  return r and (r - 1) or -1
end
function String:lastIndexOf(str, startIndex) 
	local i, j
    local k = 0
    repeat
        i = j
        j, k = __string_find(self, str, k + 1, true)
    until j == nil
    return (i or 0) - 1
end
function String:split(d) 
local t, ll
local p = self
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      l=string.find(p,d,ll,true) 
      if l~=nil then 
        table.insert(t, string.sub(p,ll,l-1)) 
        ll=l+1 
      else
        table.insert(t, string.sub(p,ll)) 
        break 
      end
    end
  return setmetatable(t, Array_Array)
end
function String:substr(pos, len) 
	return len and __string_sub(self, pos+1, pos+len)
  or __string_sub(self, pos+1)
end
HxOverrides_HxOverrides = HxOverrides_HxOverrides or {}
HxOverrides_HxOverrides.substr = String.substr
HxOverrides_HxOverrides.cca = String.charCodeAt
HxOverrides = HxOverrides_HxOverrides
Object = {}
Object.__index = Object;
Object.__super__ = nil
function Object.__tostring(o)
    local s = "{ "
    function prv(n,v)
    	s = s + n + ": " + v
    end
    local first = true
    for key, value in pairs (o) do
    	prv(first and key or (", " + key),value)
    	first = false
    end	
    return s + " }"
end
Date = {}
Date.__index = Date
Date_Date = Date
function Date.now()
	local self = {
		d = os.date("*t")
	}
	self.buf = os.time(self.d)
	return setmetatable(self, Date)
end
function Date.fromTime(t)
	local self = {
		d = os.date(t)
	}
	self.buf = os.time(self.d)
	return setmetatable(self, Date)
end
function Date.new(year, month, day, hour, min, sec)
	if year == nil then return Date.now() end
	local self = {
		d = {year = year, day = day, month = month, hour = hour, min = min, sec = sec}
	}
	self.buf = os.time(self.d)
	return setmetatable(self, Date)
end
function Date:getDate()
	return self.d.day
end
function Date:getDay()
	return os.date("%w", self:getTime())
end
function Date:getHours()
	return self.d.hour
end
function Date:getMinutes()
	return self.d.min
end
function Date:getMonth()
	return self.d.month - 1
end
function Date:getSeconds()
	return self.d.sec
end
function Date:getTime()
	return self.buf
end
function Date:getFullYear()
	return self.d.year
end
function Date.__tostring(o)
	local m = tostring(o:getMonth())
	if string.len(m) == 1 then m = "0" .. m end
	return os.date("%Y-" .. m .. "-%d %H:%M:%S", o:getTime());
end
function Date.toString(o)
	return Date.__tostring(o)
end
function Date.fromString(dateString) 
	local pattern = "(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)"
    local xyear, xmonth, xday, xhour, xminute = string.match(dateString, pattern)
    local convertedTimestamp = os.time({year = xyear, month = xmonth, 
        day = xday, hour = xhour, min = xminute, sec = xseconds})
    print(convertedTimestamp)
    print(type(convertedTimestamp))
    return Date.fromTime(convertedTimestamp)
end
HxOverrides_HxOverrides.dateStr = Date.__tostring;
HxOverrides_HxOverrides.strDate = Date.fromString;
local EReg = {}
EReg_EReg = EReg
EReg.__index = EReg
function EReg.new(def)
	local self = {}
	return setmetatable(self, EReg)
end
function EReg:match() return nil end
function EReg:matched() return nil end
function EReg:split() return nil end

exec(); exec = nil
Main_Main.main();
