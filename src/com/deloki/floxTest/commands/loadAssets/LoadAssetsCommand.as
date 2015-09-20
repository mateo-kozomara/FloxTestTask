/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */

package com.deloki.floxTest.commands.loadAssets {

import com.deloki.floxTest.models.DesignModel;

import flash.display.BitmapData;
import flash.filesystem.File;

import robotlegs.bender.bundles.mvcs.Command;
import robotlegs.bender.framework.api.ILogger;

import starling.textures.Texture;

import starling.utils.AssetManager;

public class LoadAssetsCommand extends Command {

	[Inject]
	public var logger:ILogger;

	[Inject]
	public var assetManager:AssetManager;

	[Inject]
	public var complete:LoadAssetsComplete;

	override public function execute():void {

		logger.debug("Executing: Loading assets...");

		var buttonWidth:Number = DesignModel.fullScreenWidth * .5;
		var buttonHeight:Number = buttonWidth * .25;

		var buttonUpTexture:Texture = Texture.fromBitmapData(new BitmapData(buttonWidth,buttonHeight,false,0x34495e));
		var buttonDownTexture:Texture = Texture.fromBitmapData(new BitmapData(buttonWidth,buttonHeight,false,0x2c3e50));


		assetManager.addTexture("buttonUp", buttonUpTexture);
		assetManager.addTexture("buttonDown", buttonDownTexture);

		complete.dispatch();


		/**
		 * USUALLY I WOULD LOAD ASSETS FROM A FOLDER LIKE THIS:
		 */
		/*
		var appDir:File = File.applicationDirectory;
		assetManager.enqueue(appDir.resolvePath("com/deloki/floxTest/assets/"));

		assetManager.loadQueue( onProgress );

		*/
	}

	private function onProgress(ratio:Number):void {

		if(ratio == 1)
		{
			complete.dispatch();
		}
	}
}
}