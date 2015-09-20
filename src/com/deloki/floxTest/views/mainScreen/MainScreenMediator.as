/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views.mainScreen {

import com.deloki.floxTest.commands.flox.logGoToIntro.LogGoToIntro;
import com.deloki.floxTest.commands.flox.saveFloxServerTime.SaveFloxServerTime;
import com.deloki.floxTest.enums.ScreenIDs;
import com.deloki.floxTest.globalSignals.DisplayScreenSignal;
import com.deloki.floxTest.models.FloxAnalyticsModel;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.api.ILogger;

public class MainScreenMediator extends Mediator {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var mainScreen:MainScreen;

	[Inject]
	public var displayScreen:DisplayScreenSignal;

	[Inject]
	public var logGoToIntro:LogGoToIntro;

	[Inject]
	public var saveFloxServerTime:SaveFloxServerTime;


	override public function initialize():void {

		logger.debug("Initialising Main Screen...");

		mainScreen.init();

		mainScreen.actionTriggered.add( onActionTriggered );

	}

	private function onActionTriggered(actionID:String):void {

		switch (actionID)
		{
			case MainScreen.GO_TO_INTRO:
					logGoToIntro.dispatch();
					displayScreen.dispatch(ScreenIDs.INTRO_SCREEN);
				break;
			case MainScreen.SAVE_DATA:
					saveFloxServerTime.dispatch();
				break;

		}
	}
}
}