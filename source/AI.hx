package;

import myoai.Manager;
import myoai.Engine;

import myoai.ActionType;
import myoai.SpellType;
import myoai.WeaponType;
import myoai.spells.Spell;
import myoai.weapons.Weapon;

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