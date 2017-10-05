package myoai.spells;

import myoai.characters.Character;
import myoai.spells.Spell;

/**
 * ...
 * @author Sylvain Corsini
 */
class Heal extends Spell
{
	
	public function new(target:Character) 
	{
		super("heal", target);
		
		this.setDamage(-40);
		this.setManaCost(10);
		this.setTurnWait(2);
	}
	
}