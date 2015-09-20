/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.commands.flox.saveFloxServerTime {

import com.deloki.floxTest.models.FloxAnalyticsModel;
import com.deloki.floxTest.models.SavedDateData;
import com.gamua.flox.Flox;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.framework.api.ILogger;

public class SaveFloxServerTimeCommand extends Command {

	[Inject]
	public var logger:ILogger;

	override public function execute():void {

		logger.debug("Executing: Saving server time on flox...");

		Flox.getTime(onServerDataRetrieved, onServerDataRetrieveError);

	}

	private function onServerDataRetrieveError(error:String):void {
		trace("Could not fetch server time: " + error);
	}

	private function onServerDataRetrieved(date:Date):void {
		var savedDateData:SavedDateData = new SavedDateData();
		savedDateData.id = FloxAnalyticsModel.DATE_DATA_ID;
		savedDateData.serverTime = date;
		savedDateData.saveQueued();

		/*
		 ANOTHER OPTION IS TO USE savedDateData.save( onComplete, onError );
		 */

	}

}
}