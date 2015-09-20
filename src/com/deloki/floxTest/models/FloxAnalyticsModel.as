/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.models {
import com.gamua.flox.Flox;

public class FloxAnalyticsModel {

	public static const GO_MAIN_EVENT:String = "went_to_main";
	public static const GO_INTRO_EVENT:String = "go_intro_clicked";

	public static const DATE_DATA_ID:String = "saved_data";

	private var _goToIntroButtonCounter:int;
	private var _goToMainButtonCounter:int;

	public function FloxAnalyticsModel() {

		_goToIntroButtonCounter = 0;
		_goToMainButtonCounter = 0;

	}

	public function goToMainClicked():void {
		_goToMainButtonCounter++;
	}

	public function get goToMainButtonCounter():int {
		return _goToMainButtonCounter;
	}


	public function goToIntroClicked():void {
		_goToIntroButtonCounter++;

	}

	public function get goToIntroButtonCounter():int {
		return _goToIntroButtonCounter;
	}




}
}
