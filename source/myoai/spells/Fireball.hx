package myoai.spells;

import myoai.characters.Character;
import myoai.spells.Spell;

/**
 * ...
 * @author Sylvain Corsini
 */
class Fireball extends Spell
{
	
	public function new()
	{
		super("fireball");
		
		this.setDamage(25);
		this.setManaCost(25);
		this.setTurnWait(1);
	}
	
}