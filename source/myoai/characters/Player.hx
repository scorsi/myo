package myoai.characters;

import AI;
import myoai.actions.ActionType;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Player extends Character 
{

	private var logic : AI;
	
	public function new() 
	{
		super("player");
	}
	
	override function initialize():Bool 
	{
		this.logic = new AI();
		return super.initialize();
	}
	
	override private function beginStage(number:Int) : Void 
	{
		super.beginStage(number);
		this.logic.beginStage(number);
	}
	
	override private function playTurn() : ActionType 
	{
		return this.logic.playTurn();
	}
	
}