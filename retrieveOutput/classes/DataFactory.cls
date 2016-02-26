/*
* Name: DataFactory
* Purpose: Generate random data for testing and other purposes.
* Author: Joan Barros <joan.barros@one.verizon.com>
* Creation date: July 8, 2015
*/ 
public class DataFactory {
    public DataFactory() {
        config = new Configuration();
    }
    
    public Object get(string dataType) {
        IDataGen generator = getGenerator(dataType);
        return generator.getData(config);
    }
    
    private IDataGen getGenerator(string dataType) {
        Type gen = Type.forName('DataGen'+dataType);
        // TODO: Capture the System.NullPointerException that is thrown when no generator is found
        return (IDataGen)gen.newInstance();
    }
    
    private Configuration config;
    
    public void Configure(string key, Object value) {
        config.set(key, value);
    }
}