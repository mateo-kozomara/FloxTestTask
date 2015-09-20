package {

import com.deloki.floxTest.config.AppRoot;
import com.deloki.floxTest.config.Config;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageAspectRatio;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;
import flash.text.TextField;

import org.gestouch.core.Gestouch;
import org.gestouch.extensions.starling.StarlingDisplayListAdapter;

import org.gestouch.extensions.starling.StarlingTouchHitTester;
import org.gestouch.input.NativeInputAdapter;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;

[SWF (backgroundColor="#000000", frameRate=60)]
public class FloxTest extends Sprite {

	private var _context:IContext;
	private var _starling:Starling;

	public function FloxTest() {
		stage ? init() : addEventListener(flash.events.Event.ADDED_TO_STAGE, init);
    }

	private function init(event:flash.events.Event = null):void {

		if(event)
			removeEventListener(flash.events.Event.ADDED_TO_STAGE, init);

		stage.setAspectRatio( StageAspectRatio.PORTRAIT );
		this.stage.scaleMode = StageScaleMode.NO_SCALE;
		this.stage.align = StageAlign.TOP_LEFT;

		_starling = new Starling(AppRoot, stage, new Rectangle(0,0,stage.fullScreenWidth, stage.fullScreenHeight));
		_starling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);

		_starling.start();
//		_starling.showStats = true;

		Gestouch.inputAdapter = new NativeInputAdapter(stage);
		Gestouch.addDisplayListAdapter(DisplayObject, new StarlingDisplayListAdapter());
		Gestouch.addTouchHitTester(new StarlingTouchHitTester(_starling), -1);
	}

	private function onRootCreated(event:starling.events.Event):void {

		_context = new Context()
				.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtension)
				.configure(Config, _starling, new ContextView( this ));

	}
}
}
