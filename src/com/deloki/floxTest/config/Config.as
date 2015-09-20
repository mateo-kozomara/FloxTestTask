/**
 * Created by Mateo Kozomara (mateo.kozomara@gmail.com) on 20/09/15.
 */


package com.deloki.floxTest.config {
import com.deloki.floxTest.commands.createApp.CreateApp;
import com.deloki.floxTest.commands.createApp.CreateAppCommand;
import com.deloki.floxTest.commands.flox.logGoToMain.LogGoToMain;
import com.deloki.floxTest.commands.flox.logGoToMain.LogGoToMainCommand;
import com.deloki.floxTest.commands.flox.logGoToIntro.LogGoToIntro;
import com.deloki.floxTest.commands.flox.logGoToIntro.LogGoToIntroCommand;
import com.deloki.floxTest.commands.flox.saveFloxServerTime.SaveFloxServerTime;
import com.deloki.floxTest.commands.flox.saveFloxServerTime.SaveFloxServerTimeCommand;
import com.deloki.floxTest.commands.loadAssets.LoadAssets;
import com.deloki.floxTest.commands.loadAssets.LoadAssetsCommand;
import com.deloki.floxTest.commands.loadAssets.LoadAssetsComplete;
import com.deloki.floxTest.utils.ComponentFactory;
import com.deloki.floxTest.globalSignals.DisplayScreenSignal;
import com.deloki.floxTest.models.FloxAnalyticsModel;
import com.deloki.floxTest.views.mainScreen.MainScreen;
import com.deloki.floxTest.views.mainScreen.MainScreenMediator;
import com.deloki.floxTest.views.introScreen.IntroScreen;
import com.deloki.floxTest.views.introScreen.IntroScreenMediator;
import com.deloki.floxTest.views.screenNavigator.ScreenNavigatorMediator;
import com.gamua.flox.Flox;

import feathers.controls.ScreenNavigator;

import org.osflash.signals.Signal;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.extensions.viewProcessorMap.api.IViewProcessorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;
import robotlegs.bender.framework.api.LogLevel;

import starling.utils.AssetManager;

public class Config implements IConfig {

	//---------------------------------------------------------------
	//  Public variables
	//---------------------------------------------------------------

	[Inject]
	public var context:IContext;

	[Inject]
	public var mediatorMap:IMediatorMap;

	[Inject]
	public var commandMap:ISignalCommandMap;

	[Inject]
	public var injector:IInjector;

	[Inject]
	public var contextView:ContextView;

	[Inject]
	public var viewProcessorMap:IViewProcessorMap;

	//---------------------------------------------------------------
	//  Public methods
	//---------------------------------------------------------------

	public function configure():void {

		context.logLevel = LogLevel.DEBUG;

		//      MAPPINGS
		mapMediators();
		mapCommands();
		setupInjections();

		// INIT FLOX
		Flox.init("V0eq6qVL4rgSUq3Y", "F88m1acXUkSJcbKD");

		context.afterInitializing( onAfterInitializing );

	}


	private function onAfterInitializing():void {
		Signal(injector.getInstance(LoadAssetsComplete)).addOnce(Signal(injector.getInstance(CreateApp)).dispatch);
		Signal(injector.getInstance(LoadAssets)).dispatch();
	}

	private function mapMediators():void {

		mediatorMap
				.map(IntroScreen)
				.toMediator(IntroScreenMediator);

		mediatorMap
				.map(MainScreen)
				.toMediator(MainScreenMediator);

		mediatorMap
				.map(ScreenNavigator)
				.toMediator(ScreenNavigatorMediator);
	}

	private function setupInjections():void {

		var assetManager:AssetManager = new AssetManager();
		assetManager.verbose = true;

		ComponentFactory.init(assetManager);

		injector
				.map(AssetManager).toValue(assetManager);

		injector
				.map(LoadAssetsComplete).asSingleton();

		injector
				.map(DisplayScreenSignal).asSingleton();

		injector
				.map(FloxAnalyticsModel).asSingleton();
	}


	private function mapCommands():void {

		commandMap
				.map(LoadAssets)
				.toCommand(LoadAssetsCommand);

		commandMap
				.map(CreateApp)
				.toCommand(CreateAppCommand);

		commandMap
				.map(LogGoToMain)
				.toCommand(LogGoToMainCommand);

		commandMap
				.map(LogGoToIntro)
				.toCommand(LogGoToIntroCommand);

		commandMap
				.map(SaveFloxServerTime)
				.toCommand(SaveFloxServerTimeCommand);

	}
}
}
