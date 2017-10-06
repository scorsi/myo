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
		super("enemy");
		
		this.equipWeapons(
			Manager.getWeapon(WeaponType.Sword),
			Manager.getWeapon(WeaponType.Shield));
	}
	
	override private function beginStage(stage:Int) : Void 
	{
		var damage = Std.int((10 + (stage * 2)) / 3);
		var health = Std.int(50 + (stage / .33));
		var mana = Std.int(30 + (stage / 2));
		
		this.setDamage(damage);
		this.setHealth(health);
		this.setMaxHealth(health);
		this.setMana(mana);
		this.setMaxMana(mana);
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