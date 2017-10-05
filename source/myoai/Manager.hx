package myoai;

import myoai.WeaponType;
import myoai.weapons.Weapon;
import myoai.weapons.Shield;
import myoai.weapons.Sword;

import myoai.SpellType;
import myoai.spells.Spell;
import myoai.spells.Fireball;
import myoai.spells.Heal;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Manager 
{
	
	static private var initialized : Bool = false;
	
	static private var weapons : Map<WeaponType, Weapon>;
	static private var spells : Map<SpellType, Spell>;
	
	public function new()
	{
		Manager.initialize();
	}
	
	static private function initialize() : Void
	{
		if (Manager.initialized) return;
		
		Manager.weapons = new Map<WeaponType, Weapon>();
		Manager.initializeWeapons();
		
		Manager.spells = new Map<SpellType, Spell>();
		Manager.initializeSpells();	
	}
	
	static private function initializeWeapons() : Void
	{
		Manager.weapons[WeaponType.Shield] = new Shield();
		Manager.weapons[WeaponType.Sword] = new Sword();		
	} // initializeWeapons
	
	static private function initializeSpells() : Void
	{
		Manager.spells[SpellType.Heal] = new Heal();
		Manager.spells[SpellType.Fireball] = new Fireball();
	} // initializeSpells
	
	static public function getWeapon(weaponType:WeaponType) : Weapon
	{
		return Manager.weapons[weaponType];
	} // getWeapon
	
	static public function getSpell(spellType:SpellType) : Spell
	{
		return Manager.spells[spellType];
	} // getSpell
	
}