package myoai.actions;

import myoai.spells.Spell;
import myoai.weapons.Weapon;

/**
 * @author Sylvain Corsini
 */
enum ActionType 
{
	Unknown;
	Wait;
	Attack;
	Defend;
	Cast(spell:Spell);
	Equip(weapon:Weapon);
}