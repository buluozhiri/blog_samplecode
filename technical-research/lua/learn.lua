-- �������߿�ʼ���е�ע��
--[[
��������[��]��ʾ
���е�ע�͡�
--]]


----------------------------------------------------
-- 1. �����������ơ�
----------------------------------------------------
num = 42 -- ���е����ֶ���double��
-- ���ģ� double��64λ����52λ����
-- ���澫ȷ��intֵ; ������Ҫ52λ���ڵ�intֵ��
-- �����ľ��Ȳ������⡣
s = 'walternate' -- ��Python�����Ĳ��ɱ���ַ��� ��
t = "˫����Ҳ����"
u = [[ ����������
����
���е��ַ��� ��]]
t = nil -- δ�����t; Lua ֧�������ռ���
-- do/end֮��Ĺؼ��ֱ�ʾ������飺
while num < 50 do
 num = num + 1 -- û�� ++ or += �������
end
-- If��䣺
if num > 40 then
 print('over 40')
elseif s ~= 'walternate' then -- ~= ��ʾ�����ڡ�
 -- ��Pythonһ����== ��ʾ���ڣ� �������ַ��� ��
 io.write('not over 40\n') -- Ĭ�������stdout��
else
 -- Ĭ�ϱ�������ȫ�ֵġ�
 thisIsGlobal = 5 -- ͨ�����շ�ʽ��������� ��
 -- ��ζ���ֲ�������
 local line = io.read() -- ��ȡstdin����һ�С�


 -- ..���������������ַ��� ��
 print('Winter is coming, ' .. line)
end
-- δ����ı�������nil��
-- �ⲻ�����
foo = anUnknownVariable -- ���� foo = nil.
aBoolValue = false
--ֻ��nil��false��fals; 0�� ''����true��
if not aBoolValue then print('twas false') end
-- 'or' �� 'and' ���ǿɶ�·�ģ� ����ע�� ������㹻���������ж��򲻼�������������
��ʽ����
-- ������C/js��� a?b:c ��������
ans = aBoolValue and 'yes' or 'no' --> 'no'
karlSum = 0
for i = 1, 100 do -- ��Χ��������
 karlSum = karlSum + i
end
-- ʹ�� "100, 1, -1" ��ʾ�ݼ��ķ�Χ��
fredSum = 0
for j = 100, 1, -1 do fredSum = fredSum + j end
-- ͨ���� ��Χ���ʽΪbegin, end[, step].
-- ��һ��ѭ����﷽ʽ��
repeat
 print('the way of the future')
 num = num - 1
until num == 0

----------------------------------------------------
-- 2. ������
----------------------------------------------------
function fib(n)
 if n < 2 then return 1 end
 return fib(n - 2) + fib(n - 1)
end
-- ֧�ֱհ�������������
function adder(x)
-- ����adderʱ�� �ᴴ�����ڷ��صĺ����� �����ܼ�ס����x��ֵ��


 return function (y) return x + y end
end
a1 = adder(9)
a2 = adder(36)
print(a1(16)) --> 25
print(a2(64)) --> 100
-- ����ֵ�� �������ú͸�ֵ������ʹ�ó��Ȳ�ƥ���list��
-- ��ƥ��Ľ��շ��ᱻ��Ϊnil��
-- ��ƥ��ķ��ͷ��ᱻ���ԡ�
x, y, z = 1, 2, 3, 4
-- ����x = 1, y = 2, z = 3, �� 4 �ᱻ������
function bar(a, b, c)
 print(a, b, c)
 return 4, 8, 15, 16, 23, 42
end
x, y = bar('zaphod') --> prints "zaphod nil nil"
-- ���� x = 4, y = 8, ��ֵ15..42��������
-- ������һ�ȹ��� �����Ǿֲ�����ȫ�ֵġ�
-- �����ǵȼ۵ģ�
function f(x) return x * x end
f = function (x) return x * x end
-- ��ЩҲ�ǵȼ۵ģ�
local function g(x) return math.sin(x) end
local g; g = function (x) return math.sin(x) end
-- 'local g' ����֧��g�����á�
-- ˳����һ�£� ���Ǻ������Ի���Ϊ��λ�ġ�
-- ��һ���ַ����������ú����� ����Ҫ���ţ�
print 'hello' --���Թ�����

----------------------------------------------------
-- 3. Table��


----------------------------------------------------
-- Table = LuaΨһ�����ݽṹ;
-- �����ǹ������顣
-- ������PHP���������js�Ķ���
-- �����ǹ�ϣ���ұ� dict���� Ҳ���԰�listȥʹ�á�
-- ���ֵ�/map�ķ�ʽʹ��Table��
-- Dict�ĵ���Ĭ��ʹ��string���͵�key��
t = {key1 = 'value1', key2 = false}
-- String��key������js�����õ�ȥ���ã�
print(t.key1) -- ��ӡ 'value1'.
t.newKey = {} -- ����µ� key/value �ԡ�
t.key2 = nil -- ��tableɾ�� key2��
-- ʹ���κη�nil��ֵ��Ϊkey��
u = {['@!#'] = 'qbert', [{}] = 1729, [6.28] = 'tau'}
print(u[6.28]) -- ��ӡ "tau"
-- �������ֺ��ַ�����key�ǰ���ֵ��ƥ��ģ� ���Ƕ���table���ǰ���id��ƥ�䡣
a = u['@!#'] -- ���� a = 'qbert'.
b = u[{}] -- �����ڴ����� 1729, ���ǵõ�����nil:
-- b = nil �� ��Ϊû���ҵ���
-- ֮����û�ҵ��� ����Ϊ�����õ�key�뱣������ʱ�õĲ���ͬһ������
-- �����ַ����������ǿ����Ը��õ�key��
-- ֻ��Ҫһ��table�����ĺ������ò���Ҫ���ţ�
function h(x) print(x.key1) end
h{key1 = 'Sonmi~451'} -- ��ӡ' Sonmi~451'.
for key, val in pairs(u) do -- Table �ı���.
 print(key, val)
end
-- _G ��һ�������table�� ���ڱ������е�ȫ�ֱ���


print(_G['_G'] == _G) -- ��ӡ' true'.
-- ��list/array�ķ�ʽʹ�ã�
-- List �ĵ�����ʽ���������int��key��
v = {'value1', 'value2', 1.21, 'gigawatts'}
for i = 1, #v do -- #v ��list��size
 print(v[i]) -- ������ 1 ��ʼ!! ̫����� ��
end
-- 'list' �������������ͣ� v ����һ��table��
-- ֻ��������������������Ϊkey�� ������list����ȥʹ�á�
----------------------------------------------------
-- 3.1 Ԫ�� metatable�� ��Ԫ������ metamethod����
----------------------------------------------------
-- table��Ԫ���ṩ��һ�ֻ��ƣ� �����ض���table��һЩ������
-- ֮�����ǻῴ��Ԫ�������֧������js��prototype��Ϊ��
f1 = {a = 1, b = 2} -- ��ʾһ������ a/b.
f2 = {a = 2, b = 3}
-- ����Ǵ���ģ�
-- s = f1 + f2
metafraction = {}
function metafraction.__add(f1, f2)
 sum = {}
 sum.b = f1.b * f2.b
 sum.a = f1.a * f2.b + f2.a * f1.b
 return sum
end
setmetatable(f1, metafraction)
setmetatable(f2, metafraction)
s = f1 + f2 -- ������f1��Ԫ���ϵ�__add(f1, f2) ����
-- f1, f2 û���ܷ�������Ԫ���key�� ����prototype��һ����
-- �����������getmetatable(f1) ȥ���Ԫ�� Ԫ����һ����ͨ��table��


-- Lua����ͨ��ͨ���ķ�ʽȥ��������key�� ����__add��
-- ��������Ĵ����Ǵ���ģ� ��Ϊsû��Ԫ��
-- t = s + s
-- ���������ʽ��ģʽ���Խ��������⣺
-- Ԫ���__index �������ص�������Ĳ��ң�
defaultFavs = {animal = 'gru', food = 'donuts'}
myFavs = {food = 'pizza'}
setmetatable(myFavs, {__index = defaultFavs})
eatenBy = myFavs.animal -- ���Թ����� ��Ҫ��лԪ���֧��
-- �����table��ֱ�Ӳ���keyʧ�ܣ� ��ʹ��Ԫ���__index �������ң� �����ǵݹ�Ĳ���
-- __index��ֵҲ�����Ǻ���function(tbl, key) �� ��������֧�ָ�����Զ���Ĳ��ҡ�
-- __index��__add�ȵȣ� ����ΪԪ������
-- ������table��Ԫ������ȫ���嵥��
-- __add(a, b) for a + b
-- __sub(a, b) for a - b
-- __mul(a, b) for a * b
-- __div(a, b) for a / b
-- __mod(a, b) for a % b
-- __pow(a, b) for a ^ b
-- __unm(a) for -a
-- __concat(a, b) for a .. b
-- __len(a) for #a
-- __eq(a, b) for a == b
-- __lt(a, b) for a < b
-- __le(a, b) for a <= b
-- __index(a, b) <fn or a table> for a.b
-- __newindex(a, b, c) for a.b = c
-- __call(a, ...) for a(...)


----------------------------------------------------
-- 3.2 �����table�ͼ̳С�
----------------------------------------------------
-- �ಢ�������õģ� �в�ͬ�ķ���ͨ�����Ԫ����ʵ�֡�
-- ������һ�����ӣ� �����Ƕ����ӵĽ���
Dog = {} -- 1.
function Dog:new() -- 2.
 newObj = {sound = 'woof'} -- 3.
 self.__index = self -- 4.
 return setmetatable(newObj, self) -- 5.
end
function Dog:makeSound() -- 6.
 print('I say ' .. self.sound)
end
mrDog = Dog:new() -- 7.
mrDog:makeSound() -- 'I say woof' -- 8.
-- 1. Dog����ȥ��һ���ࣻ ��ʵ����ȫ��һ��table��
-- 2. ����tablename:fn(...) �뺯��tablename.fn(self, ...) ��һ����
-- ð�ţ�:�� ֻ������� self��Ϊ��һ��������
-- ����ĵ�7�͵�8��˵���� self��������εõ���ֵ�ġ�
-- 3. newObj����Dog��һ��ʵ����
-- 4. selfΪ��ʼ������ʵ���� ͨ��self = Dog�� �����̳й�ϵ���Ըı������
-- �����newObj��Ԫ���__index������Ϊself��
-- newObj�Ϳ��Եõ�self�ĺ�����
-- 5. ��ס�� setmetatable�������һ��������
-- 6. ð�ţ����� �ڵ�2���ǹ����ģ� ����������������
-- self��һ��ʵ���� ��������
-- 7. ��Dog.new(Dog) ���ƣ� ���� self = Dog in new() ��


-- 8. ��mrDog.makeSound(mrDog) һ��; self = mrDog��
----------------------------------------------------
-- �̳е����ӣ�
LoudDog = Dog:new() -- 1.
function LoudDog:makeSound()
 s = self.sound .. ' ' -- 2.
 print(s .. s .. s)
end
seymour = LoudDog:new() -- 3.
seymour:makeSound() -- 'woof woof woof' -- 4.
-- 1. LoudDog���Dog�ķ����ͱ����б�
-- 2. ͨ��new() �� self��һ��' sound' ��key from new() �� �μ���3����
-- 3. ��LoudDog.new(LoudDog) һ���� ���ұ�ת����
-- Dog.new(LoudDog) �� ��ΪLoudDogû��' new' ��key��
-- ����������Ԫ����Կ��� __index = Dog��
-- ���: seymour��Ԫ����LoudDog�� ����
-- LoudDog.__index = LoudDog�� ������seymour.key
-- = seymour.key, LoudDog.key, Dog.key, Ҫ��
-- ��Ը�����key��һ��table����ǰ�档
-- 4. ��LoudDog�����ҵ�' makeSound' ��key�� ����
-- LoudDog.makeSound(seymour) һ����
-- �����Ҫ�� ����Ҳ������new() �� ���������ƣ�
function LoudDog:new()
 newObj = {}
 -- ��ʼ��newObj
 self.__index = self
 return setmetatable(newObj, self)
end
----------------------------------------------------


-- 4. ģ��
----------------------------------------------------
--[[ �Ұ��ⲿ�ָ�ע���� �� �����ű�ʣ�µĲ��־Ϳ���������
-- �����ļ�mod.lua�������ǣ�
local M = {}
local function sayMyName()
 print('Hrunkner')
end
function M.sayHello()
 print('Why hello there')
 sayMyName()
end
return M
-- ��һ���ļ�Ҳ����ʹ��mod.lua�ĺ�����
local mod = require('mod') -- �����ļ�mod.lua.
-- require�ǰ���ģ��ı�׼������
-- require�ȼ���: (���û�б����������� �μӺ��������)
local mod = (function ()
 <contents of mod.lua>
end)()
-- mod.lua�ͺ���һ�������壬 ����mod.lua�ľֲ����������ǲ��ɼ��ġ�
-- ����Ĵ����ǹ����ģ� ��Ϊ��mod.lua��mod = M��
mod.sayHello() -- Says hello to Hrunkner.
-- ���Ǵ���ģ� sayMyNameֻ��mod.lua�д��ڣ�
mod.sayMyName() -- ����
-- require���ص�ֵ�ᱻ���棬 ����һ���ļ�ֻ�ᱻ����һ�Σ�
-- ��ʹ����require�˶�Ρ�
-- ����mod2.lua��������"print('Hi!')"��
local a = require('mod2') -- ��ӡHi!


local b = require('mod2') -- ���ٴ�ӡ; a=b.
-- dofile��require���ƣ� ֻ�ǲ������棺
dofile('mod2') --> Hi!
dofile('mod2') --> Hi! (�ٴ����У� ��require��ͬ)
-- loadfile����һ��lua�ļ��� ���ǲ�����������
f = loadfile('mod2') -- Calling f() runs mod2.lua.
-- loadstring��loadfile���ַ����汾��
g = loadstring('print(343)') --����һ��������
g() -- ��ӡ343; �ڴ�֮ǰʲôҲ����ӡ��
--]]

----------------------------------------------------
-- 5. �ο�����
----------------------------------------------------
--[[
�ҷǳ��˷ܵ�ѧϰ lua�� ��Ҫ��Ϊ��ʹ��Love 2D��Ϸ����������Ϸ�� ����Ƕ�����
���ں�ɫ�ӵ��Ŀ�ʼ��lua������ĵġ�
���ţ� ���Ķ��� Lua�ٷ�����ֲᡣ �������ڽ׶Ρ�
 ��lua-users.org�����´�ŷǳ�ֵ�ÿ����� ��������û�и��ǵ��Ǳ�׼�⣺
* string library
* table library
* math library
* io library
* os library
���⣬ ����ļ���һ���Ϸ�Lua�� ��������Ϊlearn.lua, �����á�lua learn.lua�� ���С�
������tylerneylon.comд���£� ��Ҳ������Ϊһ��github gist�ű��� ��Lua���ı��
�ѣ�
--]]