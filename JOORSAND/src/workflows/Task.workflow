<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Type_on_Logged_Emails</fullName>
        <description>Changes Task Type to Email.</description>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Set Type on Logged Emails</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Set Type on Logged Emails</fullName>
        <actions>
            <name>Set_Type_on_Logged_Emails</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>Email:</value>
        </criteriaItems>
        <description>Sets the Activity Type for Emails logged via Salesforce Inbox as &quot;Email&quot;.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
