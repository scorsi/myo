package myoai.characters;

import myoai.actions.ActionType;
import myoai.spells.Spell;
import myoai.spells.Fireball;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Enemy extends Character 
{

	public function new() 
	{
		super("enemy", 5, 50, 30);
	}
	
	override private function beginStage(number:Int) : Void 
	{
		// Don't call to parent function because enemies don't live more than 1 stage.
	}
	
	override private function playTurn() : ActionType 
	{
		var player:Character = Engine.getPlayer();
		
		if (this.isCasting)
			return ActionType.Wait;
		
		var spell:Spell;
		if (this.health <= this.maxHealth / 3)
		{
			spell = null;
		}
		else
		{
			spell = new Fireball(player);
		}
		
		if (spell != null && this.canUseSpell(spell))
			return ActionType.Cast(spell);
		
		return ActionType.Attack;
	}
	
}