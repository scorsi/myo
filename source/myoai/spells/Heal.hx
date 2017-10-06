package myoai.spells;

import myoai.characters.Character;
import myoai.spells.Spell;

/**
 * ...
 * @author Sylvain Corsini
 */
class Heal extends Spell
{
	
	public function new() 
	{
		super("heal");
		
		this.setDamage(-30);
		this.setManaCost(10);
		this.setTurnWait(1);
	}
	
}