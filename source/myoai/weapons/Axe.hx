package myoai.weapons;

import myoai.weapons.Weapon;

/**
 * ...
 * @author Valerian Vermeulen
 */
class Axe extends Weapon
{
	
	public function new() 
	{
		super("haxe");
		
		this.setDamage(15);
		this.setTwoHanded(true);
	}
	
}