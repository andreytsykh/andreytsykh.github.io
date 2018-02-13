<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_Account_to_Outreach_Stale</fullName>
        <description>Changes the Account Status to Outreach - Stale.</description>
        <field>Status__c</field>
        <literalValue>Outreach - Stale</literalValue>
        <name>Change Account to Outreach - Stale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_TRX_Account</fullName>
        <field>TRX_Account__c</field>
        <literalValue>0</literalValue>
        <name>Clear TRX Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Was_Ever_a_Free_Customer</fullName>
        <description>Sets &quot;Was Ever a Free Customer&quot; to true.</description>
        <field>Was_Ever_a_Free_Customer__c</field>
        <literalValue>1</literalValue>
        <name>Was Ever a Free Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Change Account to Outreach - Stale</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Status__c</field>
            <operation>equals</operation>
            <value>Outreach - Fresh</value>
        </criteriaItems>
        <description>Changes the Account Status to Outreach - Stale whenever an Account with an Outreach - Fresh Status has no activity for 14 days.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Change_Account_to_Outreach_Stale</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Account.Last_Activity_Date__c</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Clear TRX Account</fullName>
        <actions>
            <name>Clear_TRX_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.of_Won_Opportunities__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>Clears the TRX flag on the account details for Legacy TRX accounts.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Was Ever a Free Customer</fullName>
        <actions>
            <name>Was_Ever_a_Free_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Free_Customer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Fires when Free Customer is checked, then checks Was Ever a Free Customer for reporting on free to paying customer conversion.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
