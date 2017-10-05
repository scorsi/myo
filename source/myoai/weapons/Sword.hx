package myoai.weapons;

import myoai.weapons.Weapon;

/**
 * ...
 * @author Sylvain Corsini
 */
class Sword extends Weapon
{
	
	public function new() 
	{
		super("sword");
		
		this.setDamage(5);
	}
	
}