// String編

// 注意: AS3では、Stringはイミュータブルであり、破壊的操作は存在しない。

var str1:String = "あいうえお";
var str2:String = "かきくけこ"; 
trace(str1+str2); // => あいうえおかきくけこ
trace(str1.charAt()); // =>  あ
trace(str1.charAt(2)); // => う
trace(str1.charCodeAt(2)); // => 12358
trace("abcd".charAt(2)); // => c
trace("abcd".charCodeAt(2)); // => 99

trace(str1.length); // => 5
trace(str1.concat("まみ","むめ","もも")); // => あいうえおまみむめもも

var addr:String = "渋谷区渋谷";
trace(addr.indexOf("谷")); // => 1
trace(addr.indexOf("谷",3)); // => 4
trace(addr.lastIndexOf("谷")); // => 4
trace(addr.lastIndexOf("谷",3)); // => 1
trace(addr.indexOf("し")); // => -1

trace("あ" < "い"); // true
trace("a" < "A");  // false
trace("a" < "あ"); // true
trace("あ" < "ア"); // true
trace("あいあ" < "あいう"); // true

//trace(1 == "1"); // コンパイル時エラー
//trace("1" == 1); // コンパイル時エラー


trace(str1.substr()); // => あいうえお
trace(str1.substr(1)); // => いうえお
trace(str1.substr(1,2)); // => いう
trace(str1.substr(1,10)); // => いうえお

trace(str1.substring()); // => あいうえお
trace(str1.substring(1)); // => いうえお
trace(str1.substring(1,2)); // => い
trace(str1.substring(1,10)); // => いうえお

trace("abCDefいろは♪".toLowerCase()); // => abcdefいろは♪
trace("abCDefいろは♪".toUpperCase()); // => ABCDEFいろは♪

trace([1,2,[3,4],5].toString()); // => 1,2,3,4,5
trace(["a","b",["c","d"],"e"].toString()); // => a,b,c,d,e
trace({a: "b", c:"d"}.toString()); // => [object Object]

trace(str1.valueOf()); // => あいうえお

// StringUtil

import flash.utils.ByteArray;

import mx.utils.StringUtil;

trace(StringUtil.isWhitespace(" ")); // => true
trace(StringUtil.isWhitespace("  ")); // => false
trace(StringUtil.isWhitespace("あ")); // => false
trace(StringUtil.isWhitespace("\t")); // => true
trace(StringUtil.isWhitespace("\r")); // => true
trace(StringUtil.isWhitespace("\n")); // => true
trace(StringUtil.isWhitespace("\r\n")); // => false
trace(StringUtil.isWhitespace("")); // => false

var strWS:String = "  あ あ あ  ";
trace(StringUtil.trim(strWS)); // => "あ あ あ"

// 全角空白には対応していない
var strWS2:String = "　あああ　";
trace(StringUtil.trim(strWS2)); // => "　あああ　"

var strSub:String = "あ{1}い{0}うえ{3}お";
trace(StringUtil.substitute(strSub,"a","b","c","d","e")); // あbいaうえdお
// restが足りないと置換されずに残る
trace(StringUtil.substitute(strSub,"a")); // あ{1}いaうえ{3}お

trace(StringUtil.substitute(strSub,1,2,3,4,5)); // あ2い1うえ4お
trace(StringUtil.substitute(strSub,["a","b","c","d","e"])); // あbいaうえdお
trace(StringUtil.substitute(strSub,["a","b","c"],"f")); // あfいa,b,cうえ{3}お
trace(StringUtil.substitute(strSub,["a"])); // あ{1}いaうえ{3}お
trace(StringUtil.substitute(strSub,{a:"b"})); // あ{1}い[object Object]うえ{3}お

trace(str1.split(new RegExp())); // あ,い,う,え,お
trace(str1.split(new RegExp(""))); // あ,い,う,え,お
trace(str1.split(new RegExp())[0]); // あ
trace(str1.split(/./)); // ,,,,,
trace(str1.split(/う/)); // あい,えお

trace(str1.match(new RegExp()) == null); // => 
trace(str1.match(new RegExp("")).valueOf()); // => 
trace(str1.match(new RegExp("!")) == null); // =>

function byteArray2Hex(ba:ByteArray):String {
	const HEX:Array = "0123456789abcdef".split(new RegExp());
	var buf:Array = new Array();
	var baLen:int = ba.length;
	for (var i:int=0; i<baLen; i++) {
		var num:int = ba[i];
		buf.push(("0"+num.toString(16)).substr(-2,2));
	}
	return buf.join("");
} 

var ba:ByteArray = new ByteArray(); 
ba.writeObject({a:"b"});
trace(ba);
trace(byteArray2Hex(ba));

trace(0x10); // => 16
var num:int = 16;
trace(num.toString(16)); // => 10
trace((31).toString(16)); // => 10
trace((10).toString(16)); // => 10

trace(parseInt("16")); // => 16
trace(parseInt("16", 16)); // => 22
trace(parseInt("16", 8)); // => 14
trace(parseInt("022")); // => 22
trace(parseInt("022", 8)); // => 18
trace(parseInt("0110", 2)); // => 6

//文字列の置き換え
function replaceChar(str:String, idx:int, char:String):String
{
	var ret:String;
	ret = str.substr(0,idx-1) + char + str.substring((idx,-1);
	return ret;
} 
trace(replaceChar(str1,2,"A"));
