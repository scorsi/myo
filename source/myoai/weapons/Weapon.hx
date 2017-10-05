package myoai.weapons;

/**
 * ...
 * @author Sylvain Corsini
 */
class Weapon 
{

	private var name : String;
	
	public function new(name:String = "weapon") 
	{
		this.name = name;
	}
	
	public function getName() : String					{ return this.name; }
	
}