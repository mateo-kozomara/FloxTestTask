/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.commands.flox.logGoToMain {

import com.deloki.floxTest.models.FloxAnalyticsModel;
import com.gamua.flox.Flox;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.framework.api.ILogger;

public class LogGoToMainCommand extends Command {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var floxAnalyticsModel:FloxAnalyticsModel;

	override public function execute():void {

		logger.debug("Executing: Logging go to main click on flox...");

		floxAnalyticsModel.goToMainClicked();
		Flox.logEvent(FloxAnalyticsModel.GO_MAIN_EVENT, { numClicks: floxAnalyticsModel.goToMainButtonCounter });



	}
}
}