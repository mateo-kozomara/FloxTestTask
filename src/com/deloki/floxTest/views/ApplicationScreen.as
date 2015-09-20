/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.views {

import feathers.controls.Screen;
import feathers.layout.VerticalLayout;

import org.osflash.signals.Signal;

import starling.utils.HAlign;

public class ApplicationScreen extends Screen {

	protected var _actionTriggered:Signal;

	public function ApplicationScreen() {

		_actionTriggered = new Signal();

		var defaultLayout:VerticalLayout = new VerticalLayout();
		defaultLayout.paddingTop = 100;
		defaultLayout.gap = 20;
		defaultLayout.horizontalAlign = HAlign.CENTER;
		layout = defaultLayout;
	}


	public function get actionTriggered():org.osflash.signals.Signal {
		return _actionTriggered;
	}
}
}
