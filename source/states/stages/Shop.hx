package states.stages;

import states.stages.objects.*;
import objects.Note;

class Shop extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	override function create()
        {
            var sky:BGSprite = new BGSprite('sky', -479.5, -301.45, 0.33, 0.33);
            add(sky);
    
            var bgCity:BGSprite = new BGSprite('citybg', -272.35, -281.25, 0.5, 0.5);
            add(bgCity);
    
            var wall:BGSprite = new BGSprite('wall', -272.35, 190.15, 1, 1);
            add(wall);
    
            var street:BGSprite = new BGSprite('floor', -964.1, 594.55, 1, 1);
            street.setGraphicSize(Std.int(street.width * 1.5));
            street.updateHitbox();
            add(street);
    
            var button:BGSprite = new BGSprite('nobodyknows', 34.95, 604.25, 1, 1);
            add(button);
            
            var wineBottle:BGSprite = new BGSprite('wine', 129.5, 600.5, 1, 1);
            add(wineBottle);
    
            var beerBottle:BGSprite = new BGSprite('beer', 927.1, 611.30, 1, 1);
            add(beerBottle);
    
            var wideBox:BGSprite = new BGSprite('box', -198.3, 532.45, 1, 1);
            add(wideBox);
    
            var boxPile:BGSprite = new BGSprite('boxpile', 1104.45, 438.05, 1, 1);
            add(boxPile);
    
            var shoppy:BGSprite = new BGSprite('shop', 370, 160, 1, 1);
            add(shoppy);
        }
        
        override function createPost()
        {
            // Use this function to layer things above characters!
            dad.setGraphicSize(Std.int(dad.width * 0.88));
            boyfriend.setGraphicSize(Std.int(boyfriend.width * 0.88));
            dad.updateHitbox();
            boyfriend.updateHitbox();
    
            var overlay:BGSprite = new BGSprite('light', 39, -930.25, 1, 1);
            overlay.blend = ADD;
            overlay.updateHitbox();
            add(overlay);
    
            var blueLight:BGSprite = new BGSprite('blue', -812.6, -679.35, 1, 1);
            blueLight.setGraphicSize(Std.int(blueLight.width * 1.5));
            blueLight.blend = ADD;
            blueLight.updateHitbox();
            add(blueLight);
    
            var frontWall:BGSprite = new BGSprite('frontwall', -1069.4, -364.8, 1.33);
            add(frontWall);
    
            var frontWall2:BGSprite = new BGSprite('frontwall', 1508.15, -364.8, 1.33);
            frontWall2.flipX = true;
            add(frontWall2);
        }

	override function update(elapsed:Float)
	{
		// Code here
	}

	override function destroy()
	{
		// Code here
	}

	
	override function countdownTick(count:Countdown, num:Int)
	{
		switch(count)
		{
			case THREE: //num 0
			case TWO: //num 1
			case ONE: //num 2
			case GO: //num 3
			case START: //num 4
		}
	}

	override function startSong()
	{
		// Code here
	}

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		// Code here
	}
	override function beatHit()
	{
		// Code here
	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	// For events
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "My Event":
		}
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}
	override function eventPushedUnique(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events where its values affect what assets should be preloaded
		switch(event.event)
		{
			case "My Event":
				switch(event.value1)
				{
					// If value 1 is "blah blah", it will preload these assets:
					case 'blah blah':
						//precacheImage('myImageOne') //preloads images/myImageOne.png
						//precacheSound('mySoundOne') //preloads sounds/mySoundOne.ogg
						//precacheMusic('myMusicOne') //preloads music/myMusicOne.ogg

					// If value 1 is "coolswag", it will preload these assets:
					case 'coolswag':
						//precacheImage('myImageTwo') //preloads images/myImageTwo.png
						//precacheSound('mySoundTwo') //preloads sounds/mySoundTwo.ogg
						//precacheMusic('myMusicTwo') //preloads music/myMusicTwo.ogg
					
					// If value 1 is not "blah blah" or "coolswag", it will preload these assets:
					default:
						//precacheImage('myImageThree') //preloads images/myImageThree.png
						//precacheSound('mySoundThree') //preloads sounds/mySoundThree.ogg
						//precacheMusic('myMusicThree') //preloads music/myMusicThree.ogg
				}
		}
	}

	// Note Hit/Miss
	override function goodNoteHit(note:Note)
	{
		// Code here
	}

	override function opponentNoteHit(note:Note)
	{
		// Code here
	}

	override function noteMiss(note:Note)
	{
		// Code here
	}

	override function noteMissPress(direction:Int)
	{
		// Code here
	}
}

