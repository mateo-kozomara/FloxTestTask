/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.models {
import com.gamua.flox.Entity;

public class SavedDateData extends Entity{

	private var _serverTime:Date;

	public function SavedDateData() {

	}

	public function get serverTime():Date {
		return _serverTime;
	}

	public function set serverTime(value:Date):void {
		_serverTime = value;
	}
}
}
