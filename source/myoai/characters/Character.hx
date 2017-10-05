package myoai.characters;

import myoai.actions.ActionType;
import myoai.spells.Spell;
import myoai.weapons.Weapon;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Character
{
	
	private var name : String;
	
	// Default character parameters
	private var standardDamage : Int;
	private var standardHealth : Int;
	private var standardMana : Int;
	private var standardHealthPerStage : Int;
	private var standardManaPerSatge : Int;
	
	// Actual character parameters
	private var damage : Int;
	private var maxHealth : Int;
	private var maxMana : Int;
	private var healthPerStage : Int;
	private var manaPerStage : Int;
	private var health : Int;
	private var mana : Int;
	
	private var castingSpell : Spell;
	private var equipedWeapon : Weapon;
	
	// Special actions
	private var isDefending : Bool;
	private var isCasting : Bool;
	
	
	//////
	// Methods
	
	public function new(name:String, damage:Int = 10, health:Int = 100, mana:Int = 100, healthPerStage:Int = 10, manaPerStage:Int = 25)
	{
		this.name = name;
		this.standardDamage = damage;
		this.standardHealth = health;
		this.standardMana = mana;
		this.standardHealthPerStage = healthPerStage;
		this.standardManaPerSatge = manaPerStage;
		
		this.castingSpell = null;
		this.equipedWeapon = null;
	} // new
	
	// Set all variables to default 
	private function initialize() : Bool
	{
		this.damage = this.standardDamage;
		this.health = this.standardHealth;
		this.maxHealth = this.standardHealth;
		this.mana = this.standardMana;
		this.maxMana = this.standardMana;
		this.healthPerStage = this.standardHealthPerStage;
		this.manaPerStage = this.standardManaPerSatge;
		
		return true;
	} // initialize
	
	private function beginStage(stage:Int) : Void
	{
		if (stage > 0)
		{
			this.health += this.healthPerStage;
			if (this.health > this.maxHealth) this.health = this.maxHealth;
			
			this.mana += this.manaPerStage;
			if (this.mana > this.maxMana) this.mana = this.maxMana;
		}
	} // beginStage
	
	private function playTurn() : ActionType
	{
		return ActionType.Unknown;
	} // playTurn
	
	//////
	// Utils
	
	public function isAlive() : Bool
	{
		return this.health > 0;
	} // isAlive
	
	public function isDead() : Bool
	{
		return this.health <= 0;
	} // isDead
	
	private function startCasting(spell:Spell) : Bool
	{
		this.stopCasting();
		if (this.mana >= spell.getManaCost())
		{
			this.useMana(spell.getManaCost());
			this.castingSpell = spell;
			this.isCasting = true;
		}
		return this.isCasting;
	} // startCasting
	
	private function stopCasting() : Void
	{
		this.isCasting = false;
		this.castingSpell = null;
	} // stopCasting
	
	private function startDefending() : Void
	{
		this.isDefending = true;
	} // startDefending
	
	private function stopDefending() : Void
	{
		this.isDefending = false;
	} // stopDefending
	
	private function reduceHealth(damage:Int) : Void
	{
		if (damage > 0)
		{
			// Take damage
			if (this.isDefending) damage = Std.int(damage / 2);
			this.health -= damage;
		}
		else
		{
			// Take heal
			this.health -= damage;
			if (this.health >= this.maxHealth) this.health = this.maxHealth;
		}
	} // reduceHealth
	
	private function useMana(amount:Int) : Bool
	{
		if (this.mana - amount < 0)
			return false;
		this.mana -= amount;
		return true;
	} // useMana
	
	public function canUseSpell(spell:Spell) : Bool
	{
		if (this.mana >= spell.getManaCost())
		{
			return !(this.isCasting);
		}
		return false;
	} // canUseSpell
	
	//////
	// Getters
	
	public function getName() : String										{ return this.name; }
	public function getDamage() : Int										{ return this.damage; }
	public function getHealth() : Int 										{ return this.health; }
	public function getMana() : Int 										{ return this.mana; }
	public function getMaxHealth() : Int 									{ return this.maxHealth; }
	public function getMaxMana() : Int 										{ return this.maxMana; }
	public function getHealthPerStage() : Int 								{ return this.healthPerStage; }
	public function getManaPerStage() : Int 								{ return this.manaPerStage; }
	public function getCastingSpell() : Spell								{ return this.castingSpell; }
	public function getEquipedWeapon() : Weapon								{ return this.equipedWeapon; }
	public function getIsCasting() : Bool									{ return this.isCasting; }
	public function getIsDefending() : Bool									{ return this.isDefending; }
	
	//////
	// Setters
	
	private function setHealth(newHealth:Int) : Void						{ this.health = newHealth; }
	private function setMana(newMana:Int) : Void							{ this.mana = newMana; }
	private function setMaxHealth(newMaxHealth:Int) : Void					{ this.maxHealth = newMaxHealth; }
	private function setMaxMana(newMaxMana:Int) : Void						{ this.maxMana = newMaxMana; }
	private function setHealthPerStage(newHealthPerStage:Int) : Void		{ this.healthPerStage = newHealthPerStage; }
	private function setManaPerStage(newManaPerStage:Int) : Void			{ this.manaPerStage = newManaPerStage; }
	
}