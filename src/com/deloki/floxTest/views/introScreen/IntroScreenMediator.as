/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views.introScreen {

import com.deloki.floxTest.commands.flox.logGoToMain.LogGoToMain;
import com.deloki.floxTest.enums.ScreenIDs;
import com.deloki.floxTest.globalSignals.DisplayScreenSignal;
import com.deloki.floxTest.models.FloxAnalyticsModel;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.api.ILogger;


public class IntroScreenMediator extends Mediator {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var introScreen:IntroScreen;

	[Inject]
	public var displayScreen:DisplayScreenSignal;

	[Inject]
	public var logGoToMain:LogGoToMain;

	override public function initialize():void {

		logger.debug("Initialising Intro Screen...");

		introScreen.init();

		introScreen.actionTriggered.add( onActionTriggered );
	}

	private function onActionTriggered(actionID:String):void {

		switch (actionID)
		{
			case IntroScreen.GO_TO_MAIN:
					logGoToMain.dispatch();
					displayScreen.dispatch(ScreenIDs.MAIN_SCREEN);
				break;
		}
	}
}
}