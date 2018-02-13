<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Marked_as_missed</fullName>
        <field>Status</field>
        <literalValue>Missed</literalValue>
        <name>Marked as missed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Time_to_interrupt</fullName>
        <field>Time_to_interrupt__c</field>
        <formula>RequestTime +    0.00691 -  0.04145</formula>
        <name>Time to interrupt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Interrupt the  live chat</fullName>
        <actions>
            <name>Time_to_interrupt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>LiveChatTranscript.Status</field>
            <operation>equals</operation>
            <value>Waiting</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Marked_as_missed</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>LiveChatTranscript.Time_to_interrupt__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
