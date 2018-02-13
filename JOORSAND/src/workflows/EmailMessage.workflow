<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Reopen_Case_status</fullName>
        <description>Update the field &quot;Status&quot; from Closed to Open when recieve the reply form customer</description>
        <field>Status</field>
        <literalValue>New</literalValue>
        <name>Reopen_Case status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date</fullName>
        <field>End_User_Last_Response_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_after_Customer_reply</fullName>
        <field>Customer_Last_Response_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Date after Customer reply</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>CASE%3A Customer last response date</fullName>
        <actions>
            <name>Update_Date_after_Customer_reply</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 or 3)</booleanFilter>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.FromAddress</field>
            <operation>notEqual</operation>
            <value>tetyana.krupchenko@ctdev.io</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.FromAddress</field>
            <operation>notEqual</operation>
            <value>tanusha_kr@ukr.net</value>
        </criteriaItems>
        <description>Populate the &apos;Customer Last Response Date&apos; field with the date of the last email from customer</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A End-User last response date</fullName>
        <actions>
            <name>Update_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Populate the &apos;End-User Last Response Date&apos; field with the date of the last email from client</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Reopen_Case status</fullName>
        <actions>
            <name>Reopen_Case_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.Incoming</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
