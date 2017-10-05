package myoai.weapons;

/**
 * ...
 * @author Sylvain Corsini
 */
@:allow(myoai.Engine)
class Weapon 
{
	
	private var name : String;
	
	private var damage : Int;
	private var twoHanded : Bool;
	
	private var canDefend : Bool;
	private var defendAmount : Int; // Percentage
	
	public function new(name:String = "weapon") 
	{
		this.name = name;
		
		this.damage = 0;
		this.twoHanded = false;
		this.canDefend = false;
		this.defendAmount = 0;
	}
	
	//////
	// Utils
	
	private function reduceDamage(damage:Int) : Int
	{
		if (!this.canDefend)
			return damage;
		return Std.int((this.defendAmount / 100) * damage);
	} // reduceDamage
	
	private function increaseDamage(damage:Int) : Int
	{
		return damage + this.damage;
	} // increaseDamage
	
	//////
	// Setters
	
	private function setDamage(damage:Int) : Void					{ this.damage = damage; }
	private function setTwoHanded(twoHanded:Bool) : Void			{ this.twoHanded = twoHanded; }
	private function setCanDefend(canDefend:Bool) : Void			{ this.canDefend = canDefend; }
	private function setDefendAmount(defendAmount:Int) : Void		{ this.defendAmount = defendAmount; }
	
	//////
	// Getters
	
	public function getName() : String								{ return this.name; }
	public function getDamage() : Int								{ return this.damage; }
	public function isTwoHanded() : Bool							{ return this.twoHanded; }
	public function getCanDefend() : Bool							{ return this.canDefend; }
	public function getDefendAmount() : Int							{ return this.defendAmount; }
	
}