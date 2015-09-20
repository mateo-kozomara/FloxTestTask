/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.globalSignals {
import org.osflash.signals.Signal;

public class DisplayScreenSignal extends Signal {
	public function DisplayScreenSignal() {
		super(String);// SCREEN_ID from ScreenIDs
	}
}
}
