<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Activate_New_Account</fullName>
        <description>Activate New Account</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Sales_Operations</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Activate_New_Account_on_JOOR</template>
    </alerts>
    <alerts>
        <fullName>Credit_Risk_Alert</fullName>
        <description>Credit Risk Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>hiren@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jenn@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>peter@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Credit_Risk_Alert</template>
    </alerts>
    <alerts>
        <fullName>Disable_Account_Alert</fullName>
        <description>Disable Account Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>jenn@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>peter@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Disable_Account_Alert</template>
    </alerts>
    <alerts>
        <fullName>Integrations_Product_Added_to_Opportunity_Alert</fullName>
        <description>Integrations Product Added to Opportunity Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Integrations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Integrations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>jpetrillo@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Integrations_Product_Added_Alert</template>
    </alerts>
    <alerts>
        <fullName>No_Payment_30_Days_After_Invoice_Sent</fullName>
        <description>No Payment 20 Days After Invoice Sent</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/No_Payment_30_Days_After_Invoice_Sent</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_Won_with_Integration_Work</fullName>
        <description>Opportunity Won with Integration Work</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Integrations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Integrations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>jpetrillo@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Integrations_Closed_Deal_Alert</template>
    </alerts>
    <alerts>
        <fullName>Termination_Letter_Alert</fullName>
        <description>Termination Letter Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>hiren@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jenn@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>peter@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Termination_Letter_Alert</template>
    </alerts>
    <alerts>
        <fullName>Won_Deal_Alert_to_Finance</fullName>
        <ccEmails>hiren@jooraccess.com</ccEmails>
        <ccEmails>kristin@jooraccess.com</ccEmails>
        <description>Won Deal Alert to Finance</description>
        <protected>false</protected>
        <recipients>
            <recipient>Director_of_Brand_Customer_Success</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Brand_Sales_EU_APAC</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Brand_Sales_NA</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Retail</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Sales_Operations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>jpetrillo@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/Finance_Closed_Deal_Alert</template>
    </alerts>
    <alerts>
        <fullName>X45_Days_Before_Renewal_Alert</fullName>
        <description>45 Day Auto-renewal Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/X45_Day_Renewal_Alert_Email</template>
    </alerts>
    <alerts>
        <fullName>X90_Days_Before_Renewal_Alert</fullName>
        <description>90 Days Before Renewal Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jpetrillo@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>System_Email_Alerts/X90_Days_Before_Renewal_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Auto_Name_Opportunity</fullName>
        <description>Automatically names the Opportunity based on its data.</description>
        <field>Name</field>
        <formula>Account.Name+&quot; - &quot;+TEXT(Type)+&quot; ($&quot;+LEFT(TEXT(ROUND(Amount,1)),
(LEN(TEXT(ROUND(Amount,1)))-3))+&quot;k) - &quot;+TEXT(StageName)+
&quot; - &quot;+TEXT(Contract_Start_Date__c)</formula>
        <name>Auto-Name Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Account_to_Customer_Partner</fullName>
        <description>Changes the Account Status to Customer - Partner.</description>
        <field>Status__c</field>
        <literalValue>Customer - Partner</literalValue>
        <name>Change Account to Customer - Partner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Account_to_Customer_Paying</fullName>
        <description>Changes the Account Status to Customer - Paying.</description>
        <field>Status__c</field>
        <literalValue>Customer - Paying</literalValue>
        <name>Change Account to Customer - Paying</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Account_to_Open_Opportunity</fullName>
        <description>Changes the Account Status to Open Opportunity.</description>
        <field>Status__c</field>
        <literalValue>Open Opportunity</literalValue>
        <name>Change Account to Open Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_At_Risk_Date</fullName>
        <description>Clears the At Risk Date field.</description>
        <field>At_Risk_Date__c</field>
        <name>Clear At Risk Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_At_Risk_Notes</fullName>
        <description>Clears the At Risk Notes field.</description>
        <field>At_Risk_Notes__c</field>
        <name>Clear At Risk Notes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Customer_Checkbox_Checked</fullName>
        <description>Checks off the Customer Checkbox field (indicates any account that has even been a customer, unchanged after being checked).</description>
        <field>Customer_Checkbox__c</field>
        <literalValue>1</literalValue>
        <name>Customer Checkbox Checked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partnership_Checkbox_Checked</fullName>
        <description>Checks off the Partnership Checkbox on the Account.</description>
        <field>Partnership_Checkbox__c</field>
        <literalValue>1</literalValue>
        <name>Partnership Checkbox Checked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Close_Date_to_Today</fullName>
        <description>Changes the Close Date to TODAY()</description>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Set Close Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Customer_Start_Date</fullName>
        <description>Sets the Customer Start Date on the Account to TODAY() whenever a New Business Opportunity is won.</description>
        <field>Customer_Start_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Customer Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Partnership_Start_Date</fullName>
        <description>Sets the Partnership Start Date to Today()</description>
        <field>Partnership_Start_Date__c</field>
        <formula>TODAY()</formula>
        <name>Set Partnership Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_At_Risk_Date</fullName>
        <description>Sets the At Risk Date to NOW()</description>
        <field>At_Risk_Date__c</field>
        <formula>NOW()</formula>
        <name>Stamp At Risk Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Next_Steps_Changed_Date</fullName>
        <description>Sets Next Steps Changed Date to NOW()</description>
        <field>Next_Steps_Changed_Date__c</field>
        <formula>NOW()</formula>
        <name>Stamp Next Steps Changed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Stage_Changed_Date</fullName>
        <description>Sets Stage Changed Date to NOW()</description>
        <field>Stage_Changed_Date__c</field>
        <formula>NOW()</formula>
        <name>Stamp Stage Changed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Free_Customer</fullName>
        <field>Free_Customer__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Free Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>%5BONE TIME%5D Alert 90 Days before Renewal</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Trigger__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>[ONE TIME TRIGGER FOR EXISTING RECORDS ON LAUNCH OF SFDC] Email alert to the Renewal Opportunity Owner 90 days before the contract start date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>X90_Days_Before_Renewal_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Contract_Start_Date__c</offsetFromField>
            <timeLength>-90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Activate Account Alert</fullName>
        <actions>
            <name>Activate_New_Account</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Invoice_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Invoice_Paid__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ARR__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <description>Alert to inform all necessary parties that the account should be activated on JOOR.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert 45 Days before Renewal</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Email alert to the Renewal Opportunity Owner 45 days before the contract start date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Opportunity.Contract_Start_Date__c</offsetFromField>
            <timeLength>-45</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Alert 90 Days before Renewal</fullName>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) OR (1 AND 2 AND 4)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Contract_Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>11_Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>12_Closed Lost</value>
        </criteriaItems>
        <description>Email alert to the Renewal Opportunity Owner 90 days before the contract start date.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>X90_Days_Before_Renewal_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Contract_Start_Date__c</offsetFromField>
            <timeLength>-90</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Auto-Name Opportunity</fullName>
        <actions>
            <name>Auto_Name_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Automatically names the opportunity based on its data.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change Account to Customer - Partner</fullName>
        <actions>
            <name>Change_Account_to_Customer_Partner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partnership_Checkbox_Checked</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Partnership_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsWon</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Partnership</value>
        </criteriaItems>
        <description>Changes the Account Status to Customer - Partner, checks off the Partnership Checkbox field, and sets the Partnership Start Date field whenever a Partnership Opportunity is won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change Account to Customer - Paying</fullName>
        <actions>
            <name>Change_Account_to_Customer_Paying</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Customer_Checkbox_Checked</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Customer_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Uncheck_Free_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsWon</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Business</value>
        </criteriaItems>
        <description>Changes the Account Status to Customer - Paying, checks off the Customer Checkbox field, and sets the Customer Start Date field whenever a New Business Opportunity is won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change Account to Open Opportunity</fullName>
        <actions>
            <name>Change_Account_to_Open_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Business,Partnership</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>notEqual</operation>
            <value>Customer - Paying</value>
        </criteriaItems>
        <description>Changes the Account Status to Open Opportunity whenever a New Business or Partnership Opportunity is created and the Status is not already Customer.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clear At Risk Date</fullName>
        <actions>
            <name>Clear_At_Risk_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_At_Risk_Notes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.At_Risk__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Clears the At Risk Date when At Risk is unchecked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Credit Risk Alert</fullName>
        <actions>
            <name>Credit_Risk_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>11_Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Credit_Risk__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Triggers a credit risk email alert to account owner and opportunity owner when the Credit Risk field has been marked &quot;yes&quot; by Finance.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Disable Account Alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>11_Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Invoice_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Credit_Risk__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Alert sent to the owners to inform them to &quot;soft&quot; disable their account on JOOR since payment has not been received.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Disable_Account_Alert</name>
                <type>Alert</type>
            </actions>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Finance Closed Deal Alert</fullName>
        <actions>
            <name>Won_Deal_Alert_to_Finance</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsWon</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Email alert to finance and sales leadership whenever an opportunity is won.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Integration Work Product Added to Opportunity</fullName>
        <actions>
            <name>Integrations_Product_Added_to_Opportunity_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Integrations_Product_Present__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>Fires whenever integrations product is added to the opportunity (JOOR Service Fee).</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Invoice Sent but not Paid</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Invoice_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Invoice_Paid__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Fires when invoice sent is checked, and will send an alert to the account owner 20 days later if invoice paid remains unchecked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>No_Payment_30_Days_After_Invoice_Sent</name>
                <type>Alert</type>
            </actions>
            <timeLength>20</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Invoice Sent but not Paid %28Old%29</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Invoice_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Invoice_Paid__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Fires when invoice sent is checked, and will send an alert to the account owner 30 days later if invoice paid remains unchecked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>No_Payment_30_Days_After_Invoice_Sent</name>
                <type>Alert</type>
            </actions>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Opportunity Won with Integration Work</fullName>
        <actions>
            <name>Opportunity_Won_with_Integration_Work</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.IsWon</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Integrations_Product_Present__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New Business,Renewal</value>
        </criteriaItems>
        <description>Fires whenever new business or renewal opportunities with integrations product present.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Close Date to Today</fullName>
        <actions>
            <name>Set_Close_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Changes Close Date to TODAY() whenever the opportunity is closed (won or lost).</description>
        <formula>AND(
IsClosed,
ISCHANGED(StageName),
NOT(ISCHANGED(AccountId))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp At Risk Date</fullName>
        <actions>
            <name>Stamp_At_Risk_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.At_Risk__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets the At Risk Date when At Risk is checked off.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Next Steps Changed Date</fullName>
        <actions>
            <name>Stamp_Next_Steps_Changed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggered when Next Steps are changed and stamps the date in Next Steps Changed Date.</description>
        <formula>ISCHANGED(Next_Steps__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Stage Changed Date</fullName>
        <actions>
            <name>Stamp_Stage_Changed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Triggered when Stage is changed and stamps the date in Stage Changed Date.</description>
        <formula>ISCHANGED(StageName)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Termination Letter Alert</fullName>
        <actions>
            <name>Termination_Letter_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>12_Closed Lost</value>
        </criteriaItems>
        <description>Alert to inform accounting to send a termination letter for churned accounts.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
