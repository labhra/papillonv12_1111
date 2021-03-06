package shiro_test

class Server {

	String serverName
	Integer rack
	Integer floor
	String location
	
	static hasMany = [results: Result, costcenters: Cost_Center]
	static belongsTo = Cost_Center
	
    static constraints = {
		serverName()
		location()
		rack()
		floor()
    }
	
	String toString(){
		return "dc1" + "fl1" +"rk1" + "ht1"
	}
}

