/*
* Name: DataFactory_Test
* Purpose: test class for the DataFactory class
* Author: Joan Barros <joan.barros@one.verizon.com>
* Creation Date: July 8, 2015
*/

@isTest
public class DataFactory_Test {
    /*
     * Basic use case.
     * 
     * Data of a type "Test" is requested and a string different than empty is expected.
     */
    static testmethod void getData_TestGenerator() {
        DataFactory df = new DataFactory();
        string target = (string)df.get('testtype');
        
        System.assertNotEquals('', target, 'The provided value is an empty string');
    }
    
    /*
     * Configure the generator
     * 
     * Allow the configuration of the generator to return a specific result
     */
    static testmethod void getData_ParameterConfiguration() {
        DataFactory df = new DataFactory();
        
        df.Configure('length', 15);
        
        string target = (string)df.get('testtype');
        
        System.assertEquals(15, target.length());
    }
    
    /*
     * Configure a specific type
     * 
     * Allow to configure a specific type
     */
    static testmethod void getData_TypeSpecificConfiguration() {
        DataFactory df = new DataFactory();
        
        df.Configure('length', 15);
        df.Configure('testtype.length', 14);
        
        string target = (string)df.get('testtype');
        
        System.assertEquals(14, target.length());
    }
}
