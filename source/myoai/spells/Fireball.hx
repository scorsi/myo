package myoai.spells;

import myoai.characters.Character;
import myoai.spells.Spell;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Fireball extends Spell
{
	
	public function new(target:Character)
	{
		super("fireball", target);
		
		this.setDamage(25);
		this.setManaCost(25);
		this.setTurnWait(1);
	}
	
}