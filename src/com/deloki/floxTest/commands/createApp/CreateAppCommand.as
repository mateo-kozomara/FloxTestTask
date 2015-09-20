/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.commands.createApp {

import com.deloki.floxTest.config.AppRoot;
import com.deloki.floxTest.models.DesignModel;
import com.deloki.floxTest.views.introScreen.IntroScreen;
import com.gamua.flox.Flox;

import feathers.controls.ScreenNavigator;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.framework.api.ILogger;

import starling.core.Starling;
import starling.display.Quad;
import starling.display.Sprite;

public class CreateAppCommand extends Command {

	[Inject]
	public var logger:ILogger;

	override public function execute():void {

		logger.debug("Executing: Creating application...");

		var root:AppRoot = AppRoot(Starling.current.root);

		addGradientBackground(root);

		var screenNavigator:ScreenNavigator = new ScreenNavigator();
		root.addChild(screenNavigator);

	}

	private function addGradientBackground(container:Sprite):void {
		/**
		 * Add gradient Background
		 */
		var bottomColor:uint = 0x7454b0; // blue
		var topColor:uint    = 0x2980b9; // red
		var quad:Quad = new Quad(DesignModel.fullScreenWidth, DesignModel.fullScreenHeight);
		quad.setVertexColor(0, topColor);
		quad.setVertexColor(1, topColor);
		quad.setVertexColor(2, bottomColor);
		quad.setVertexColor(3, bottomColor);
		container.addChild(quad);
	}
}
}