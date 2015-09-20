/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views.introScreen {


import com.deloki.floxTest.utils.ComponentFactory;
import com.deloki.floxTest.models.DesignModel;
import com.deloki.floxTest.views.ApplicationScreen;


import starling.display.Button;
import starling.events.Event;

public class IntroScreen extends ApplicationScreen {

	public static const GO_TO_MAIN:String = "goToMain";


	public function init():void {

		var button:Button = ComponentFactory.createButton("Go To Main");
		button.name = GO_TO_MAIN;
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
