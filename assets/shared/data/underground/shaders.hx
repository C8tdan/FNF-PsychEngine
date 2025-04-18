var lightShader;
var lightShaderName = 'lightHandlerShader';

var caShader;
var caShaderName = 'caShader';

var contrastValue:Float = 1.0;        // first value
var contrastMin:Float = 0.0;          // mininum value
var contrastMax:Float = 40;          // maxinum value
var contrastSpeed:Float = 0.05;        // alteration speed (più basso = più lento)
var contrastDirection:Int = 1;        // alteration direction

var brightnessValue:Float = 0.0;      // first value
var brightnessMin:Float = -40;      // mininum value
var brightnessMax:Float = 0.0;       // maxinum value

var caIntensityValue:Float = 0.0;     // first value
var caIntensityMin:Float = 0.05;     // mininum value
var caIntensityMax:Float = 0.25;     // maxinum value

function onCreatePost()
{
	game.initLuaShader(lightShaderName);
	lightShader = game.createRuntimeShader(lightShaderName);
	game.initLuaShader(caShaderName);
	caShader = game.createRuntimeShader(caShaderName);
	var shaderFilter:ShaderFilter = new ShaderFilter(lightShader);
	var shaderFilter2:ShaderFilter = new ShaderFilter(caShader);
	game.camGame.setFilters([shaderFilter, shaderFilter2]);
}

function onUpdate(elapsed:Float)
{
	contrastValue += contrastDirection * contrastSpeed * elapsed;
        
	if (contrastValue >= contrastMax) {
		contrastValue = contrastMax;
		contrastDirection = -1;
	} else if (contrastValue <= contrastMin) {
		contrastValue = contrastMin;
		contrastDirection = 1;
	}
	
	var t = (contrastValue - contrastMin) / (contrastMax - contrastMin);
	brightnessValue = brightnessMax - t * (brightnessMax - brightnessMin);
	caIntensityValue = caIntensityMin + t * (caIntensityMax - caIntensityMin);
	
	lightShader.setFloat("contrast", contrastValue);
	lightShader.setFloat("brightness", brightnessValue);

	caShader.setFloat("amount", caIntensityValue);
}