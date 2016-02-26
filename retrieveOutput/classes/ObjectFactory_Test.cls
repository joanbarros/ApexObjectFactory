/*
* Name: ObjectFactory_Test
* Purpose: test class for the ObjectFactory class
* Author: Jose Medina
* Creation Date: may 5, 2015
*/
@isTest
public class ObjectFactory_Test {
    public static  void getUser_when_noCreateDependentObjectsAndNoMakeInsert(){
        Test.startTest();

        List<Profile> profiles = [select id from profile where name = 'system administrator'];


        List<User> users = (List<User>)ObjectFactory.getUser(1, profiles[0].id, false, false);

        System.assertEquals(false, users.isEmpty(), 'User no created when no providing arguments.');
        System.assertNotEquals(null, users[0], 'User is null when created with not dependent objects and make insert = false.');

        Test.stopTest();
    }




    public static  void generateRandomObjectForField_when_allPosibleTypesProvided(){
        Test.startTest();

        integer integerValue = (Integer)ObjectFactory.generateRandomData(Schema.DisplayType.INTEGER, 10,0);
        string base64BinaryValue = (string)ObjectFactory.generateRandomData(Schema.DisplayType.BASE64, 10,0);
        Boolean booleanValue = (Boolean)ObjectFactory.generateRandomData(Schema.DisplayType.BOOLEAN, null,null);
        Decimal currencyValue = (Decimal)ObjectFactory.generateRandomData(Schema.DisplayType.CURRENCY, 10,10);
        Date DateValue = (Date)ObjectFactory.generateRandomData(Schema.DisplayType.DATE, null,null);
        DateTime DateTimeValue = (DateTime)ObjectFactory.generateRandomData(Schema.DisplayType.DATETIME, null, null);
        Double DoubleValue = (Double)ObjectFactory.generateRandomData(Schema.DisplayType.DOUBLE, 10,10);
        String EmailValue = (String)ObjectFactory.generateRandomData(Schema.DisplayType.EMAIL, null,null);
        String EncryptedStringValue = (String)ObjectFactory.generateRandomData(Schema.DisplayType.ENCRYPTEDSTRING, 10,null);
        ID idValue = (ID)ObjectFactory.generateRandomData(Schema.DisplayType.ID, null,null);
        string MultiPicklistValue = (string)ObjectFactory.generateRandomData(Schema.DisplayType.MULTIPICKLIST, 10,null);
        decimal PercentValue = (decimal)ObjectFactory.generateRandomData(Schema.DisplayType.PERCENT, 10,2);
        string PhoneValue = (string)ObjectFactory.generateRandomData(Schema.DisplayType.PHONE, null,null);
        string PicklistValue = (string)ObjectFactory.generateRandomData(Schema.DisplayType.PICKLIST, null,null);
        ID ReferenceValue = (ID)ObjectFactory.generateRandomData(Schema.DisplayType.REFERENCE, null,null);
        String StringValue = (String)ObjectFactory.generateRandomData(Schema.DisplayType.STRING, 10,null);
        String TextAreaValue = (String)ObjectFactory.generateRandomData(Schema.DisplayType.TEXTAREA, 10,null);
        Time timeValue = (time)ObjectFactory.generateRandomData(Schema.DisplayType.TIME, null,null);

        System.assertNotEquals(null, integerValue, 'Value not created for Integer type');
        System.assertNotEquals(null, base64BinaryValue, 'Value not created for Base64Binary type');
        System.assertNotEquals(null, booleanValue, 'Value not created for Boolean type');
        System.assertNotEquals(null, currencyValue, 'Value not created for Currency type');
        System.assertNotEquals(null, DateValue, 'Value not created for Date type');
        System.assertNotEquals(null, DateTimeValue, 'Value not created for DateTime type');
        System.assertNotEquals(null, DoubleValue, 'Value not created for Double type');
        System.assertNotEquals(null, EmailValue, 'Value not created for Email type');
        System.assertNotEquals(null, EncryptedStringValue, 'Value not created for Encrypted String type');
        System.assertNotEquals(null, idValue, 'Value not created for ID type');
        System.assertNotEquals(null, MultiPicklistValue, 'Value not created for MultiPicklist type');
        System.assertNotEquals(null, PercentValue, 'Value not created for percent type');
        System.assertNotEquals(null, PhoneValue, 'Value not created for Phone type');
        System.assertNotEquals(null, PicklistValue, 'Value not created for Picklist type');
        System.assertNotEquals(null, ReferenceValue, 'Value not created for Reference type');
        System.assertNotEquals(null, StringValue, 'Value not created for String type');
        System.assertNotEquals(null, TextAreaValue, 'Value not created for TextArea type');
        System.assertNotEquals(null, timeValue, 'Value not created for Time type');


        Test.stopTest();
    }


    public static  void createAccount_when_noProvidingAnyValues(){
        Test.startTest();
        Account account = (Account)ObjectFactory.createSObject('Account');

        System.assertNotEquals(null, account, 'The account created with default values is null');

        Test.stopTest();
    }


    public static  void createOportunity_when_noProvindingAnyValues(){
        Test.startTest();

        Opportunity opportunity = (Opportunity)ObjectFactory.createSObject('Opportunity');

        System.assertNotEquals(null, opportunity,'The opportunity create with default values is null');

        Test.stopTest();
    }





    public static testMethod void createAccount_when_creatingDependentCascadeObjects(){

        Test.startTest();

        Opportunity opportunity = (Opportunity)ObjectFactory.createSObject('Opportunity', true);

        System.assertNotEquals(null, opportunity, 'The Opportunity was not created when default values and create in cascade master detail objects');

        Test.stopTest();
    }





}