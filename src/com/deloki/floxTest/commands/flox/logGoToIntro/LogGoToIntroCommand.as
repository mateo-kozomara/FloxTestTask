/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.commands.flox.logGoToIntro {

import com.deloki.floxTest.models.FloxAnalyticsModel;
import com.gamua.flox.Flox;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.framework.api.ILogger;

public class LogGoToIntroCommand extends Command {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var floxAnalyticsModel:FloxAnalyticsModel;

	override public function execute():void {

		logger.debug("Executing: Logging go to intro click on flox... ");

		floxAnalyticsModel.goToIntroClicked();
		Flox.logEvent(FloxAnalyticsModel.GO_INTRO_EVENT, { numClicks: floxAnalyticsModel.goToIntroButtonCounter });

	}
}
}