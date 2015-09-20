/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views.mainScreen {
import com.deloki.floxTest.utils.ComponentFactory;
import com.deloki.floxTest.views.ApplicationScreen;


import starling.display.Button;
import starling.events.Event;


public class MainScreen extends ApplicationScreen {

	public static const GO_TO_INTRO:String = "goToIntro";
	public static const SAVE_DATA:String = "saveData";

	public function init():void {

		var button:Button;

		button = ComponentFactory.createButton("Go To Intro");
		button.name = GO_TO_INTRO;
		addChild(button);
		button.addEventListener(Event.TRIGGERED, onButtonTriggered);

		button = ComponentFactory.createButton("Save Data");
		button.name = SAVE_DATA;
		addChild(button);
		button.addEventListener(Event.TRIGGERED, onButtonTriggered);


	}

	private function onButtonTriggered(event:Event):void {

		var button:Button = event.target as Button;
		if(!button)
			return;

		_actionTriggered.dispatch(button.name);

	}
}
}
