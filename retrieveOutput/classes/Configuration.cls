/*
* Name: DataFactory_Test
* Purpose: test class for the DataFactory class
* Author: Joan Barros <joan.barros@one.verizon.com>
* Creation Date: July 8, 2015
*/

public class Configuration {
    private Map<string, object> storage = new Map<string, object>();
    
	public void set(string key, object value) {
        storage.put(key, value);
    }
    
    public Configuration getConfigForType(string dataType) {
        return this;
    }
    
    public Object get(string key) {
        return storage.get(key);
    }
}