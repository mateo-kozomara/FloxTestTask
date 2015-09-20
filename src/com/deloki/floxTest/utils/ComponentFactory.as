/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */
package com.deloki.floxTest.utils {
import starling.display.Button;
import starling.utils.AssetManager;

public class ComponentFactory {
	private static var _assetManager:AssetManager;

	public static function init(assetManager:AssetManager):void {
		ComponentFactory._assetManager = assetManager;
	}

	public static function createButton(label:String):Button {
		var button:Button = new Button(_assetManager.getTexture("buttonUp"), label, _assetManager.getTexture("buttonDown"));
		button.fontColor = 0xffffff;
		button.fontSize = button.height * .4;
		return button;
	}
}
}
