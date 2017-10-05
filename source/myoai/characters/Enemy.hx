package myoai.characters;

import myoai.Manager;
import myoai.Engine;

import myoai.ActionType;
import myoai.SpellType;
import myoai.WeaponType;
import myoai.spells.Spell;
import myoai.weapons.Weapon;

/**
 * ...
 * @author Sylvain Corsini
 */
class Enemy extends Character 
{
	
	public function new() 
	{
		super("enemy", 0, 50, 30);
		
		this.equipWeapons(
			Manager.getWeapon(WeaponType.Sword),
			Manager.getWeapon(WeaponType.Shield));
	}
	
	override private function beginStage(number:Int) : Void 
	{
		// Never called.
		// Don't call to parent function because enemies don't live more than 1 stage.
	}
	
	override private function playTurn() : ActionType 
	{
		super.playTurn();
		var player:Character = Engine.getPlayer();
		
		if (this.isCasting)
			return ActionType.Wait;
		
		var spell:Spell = Manager.getSpell(SpellType.Fireball);
		if (spell != null && this.canUseSpell(spell))
			return ActionType.Cast(spell, player);
		
		return ActionType.Attack;
	}
	
}