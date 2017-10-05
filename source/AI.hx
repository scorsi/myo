package;

import myoai.actions.ActionType;
import myoai.Engine;

/**
 * The user AI implementation.
 */
class AI 
{
	
	public function new()
	{
		// Do something at first stage
	}
	
	public function beginStage(stage:Int) : Void
	{
		// Do something at each new stage
	}
	
	public function playTurn() : ActionType
	{
		return ActionType.Wait;
	}
	
}