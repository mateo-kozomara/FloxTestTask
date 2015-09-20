/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views.screenNavigator {

import com.deloki.floxTest.enums.ScreenIDs;
import com.deloki.floxTest.globalSignals.DisplayScreenSignal;
import com.deloki.floxTest.views.mainScreen.MainScreen;
import com.deloki.floxTest.views.introScreen.IntroScreen;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.motion.Fade;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.api.ILogger;

public class ScreenNavigatorMediator extends Mediator {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var screenNavigator:ScreenNavigator;

	[Inject]
	public var displayScreen:DisplayScreenSignal;


	override public function initialize():void {

		logger.debug("Initialising ScreenNavigator...");

		screenNavigator.transition = Fade.createCrossfadeTransition();

		createScreens();

		displayScreen.add(onDisplayScreen);

		screenNavigator.showScreen(ScreenIDs.INTRO_SCREEN);
	}

	private function onDisplayScreen(screenID:String):void {
		screenNavigator.showScreen(screenID);
	}

	private function createScreens():void {
		var screenItem:ScreenNavigatorItem;

		screenItem = new ScreenNavigatorItem(IntroScreen);
		screenNavigator.addScreen( ScreenIDs.INTRO_SCREEN, screenItem );

		screenItem = new ScreenNavigatorItem(MainScreen);
		screenNavigator.addScreen( ScreenIDs.MAIN_SCREEN, screenItem );

	}
}
}