package myoai.weapons;

import myoai.weapons.Weapon;

/**
 * ...
 * @author Sylvain Corsini
 */
class Shield extends Weapon
{
	
	public function new() 
	{
		super("shield");
		
		this.setCanDefend(true);
		this.setDefendAmount(25);
	}
	
}