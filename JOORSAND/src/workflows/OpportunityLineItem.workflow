<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_Product_Code</fullName>
        <description>Stamps the product code to the custom product code field on opportunity product.</description>
        <field>Product_Code__c</field>
        <formula>Product2.ProductCode</formula>
        <name>Stamp Product Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Stamp Product Code</fullName>
        <actions>
            <name>Stamp_Product_Code</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamps the product code onto the line item whenever it&apos;s added to the opportunity.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
