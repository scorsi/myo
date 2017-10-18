package;

import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import myoai.Engine;

/**
 * ...
 * @author Sylvain Corsini
 */
class Main extends Sprite
{
	
	static function main()
	{
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
	
	private var engine : Engine;
	private var isGameValid : Bool;
	private var canUpdateEngine : Bool;
	
	public function new() 
	{
		super();
		
		this.addEventListener(Event.ADDED_TO_STAGE, this.added);
	}
	
	public function added(e:Event)
	{
		this.removeEventListener(Event.ADDED_TO_STAGE, this.added);
		
		#if ios
			haxe.Timer.delay(this.initialize, 100); // iOS 6
		#else
			this.initialize();
		#end
	}
	
	public function initialize() : Void
	{
		this.engine = new Engine(this);
		this.isGameValid = this.engine.initialize();
		this.canUpdateEngine = true;
		
		this.addEventListener(Event.ENTER_FRAME, this.update);
	}
	
	private function update(e:Event) : Void
	{
		if (!this.isGameValid)
			this.isGameValid = this.engine.initialize();
		else
		{
			if (this.canUpdateEngine)
			{
				this.isGameValid = this.engine.update();
				
				this.canUpdateEngine = false;
				Timer.delay(function () {
					this.canUpdateEngine = true;
				}, 200);
			}
		}
	}
	
}
