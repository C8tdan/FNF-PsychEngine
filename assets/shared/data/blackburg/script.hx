var shaderTag;
var shaderName = 'lightHandlerShader';

var hue:Float = 0;
var saturation:Float = 0;
var contrast:Float = 0;
var brightness:Float = 0;


function onCreatePost()
{
    game.initLuaShader(shaderName);
	shaderTag = game.createRuntimeShader(shaderName);
}

function onStepHit()
{
    switch (curStep)
    {
        case 1184:
            game.camGame.setFilters([new ShaderFilter(shaderTag)]);

            game.camZooming = false;

            FlxTween.tween(FlxG.camera, {zoom: 1.15}, 0.8, {ease: FlxEase.circOut});
            
            FlxTween.num(0, -20, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("hue", value);
            });
            FlxTween.num(0, -20, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("saturation", value);
            });
            FlxTween.num(0, 15, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("contrast", value);
            });
            FlxTween.num(0, -20, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("brightness", value);
            });
        case 1312:
            FlxTween.num(-20, 0, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("hue", value);
            });
            FlxTween.num(-20, 0, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("saturation", value);
            });
            FlxTween.num(15, 0, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("contrast", value);
            });
            FlxTween.num(-20, 0, 0.25, {ease: FlxEase.quadOut}, function(value:Float) {
                shaderTag.setFloat("brightness", value);
            });
        case 1320:
            game.camGame.setFilters(null);
    }
}

