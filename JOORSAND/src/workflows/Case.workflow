<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CASE_Comments_from_customer_Integrations</fullName>
        <description>CASE: Comments from customer Integrations</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Automation_emails/CASE_Comments_from_customer_Integrations</template>
    </alerts>
    <alerts>
        <fullName>CASE_JDT_Notification_of_case_closure</fullName>
        <description>Notification of case closure</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/JDT_Notification_of_case_closure</template>
    </alerts>
    <alerts>
        <fullName>CASE_JDT_Notification_of_case_creatio</fullName>
        <description>Notification about case creation to the customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/JDT_Notification_of_case_creation</template>
    </alerts>
    <alerts>
        <fullName>CASE_RSM_New_status</fullName>
        <description>Case has been in status New for 4 hours</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/CASE_New_case_for_4_hours</template>
    </alerts>
    <alerts>
        <fullName>CSM_Product_Support_Level_1</fullName>
        <description>CSM/Product Support - Level 1</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>jezelle@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>saara@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Case_Escalation</template>
    </alerts>
    <alerts>
        <fullName>CSM_Product_Support_Level_2</fullName>
        <description>CSM/Product Support - Level 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>brice@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jezelle@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>saara@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Case_Escalation</template>
    </alerts>
    <alerts>
        <fullName>CSM_Product_Support_Level_3</fullName>
        <description>CSM/Product Support - Level 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>jezelle@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mdicanzio@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>saara@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Case_Escalation</template>
    </alerts>
    <alerts>
        <fullName>Case_has_been_in_status_In_Progress_for_24_hours_Retail</fullName>
        <description>Case has been in status In Progress for 24 hours Retail</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>retail@jooraccess.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/CASE_In_Progress_for_24_hours</template>
    </alerts>
    <alerts>
        <fullName>Case_has_been_in_status_In_Progress_for_6_hours</fullName>
        <description>Case has been in status In Progress for 24 hours</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Automation_emails/CASE_In_Progress_for_24_hours</template>
    </alerts>
    <alerts>
        <fullName>Case_has_been_in_status_New_for_4_hours_Integrations</fullName>
        <description>Case has been in status New for 4 hours Integrations</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Automation_emails/CASE_New_case_for_4_hours</template>
    </alerts>
    <alerts>
        <fullName>Case_has_not_been_Closed_in_48_hours</fullName>
        <description>Case has not been Closed in 48 hours</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/CASE_Case_has_not_been_closed_in_48_hours</template>
    </alerts>
    <alerts>
        <fullName>Case_has_not_received_a_response_for_48_hours</fullName>
        <description>Case has not received a response for 48 hours</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/CASE_No_end_user_response_for_48_hours</template>
    </alerts>
    <alerts>
        <fullName>Critical_Integrations_Case</fullName>
        <description>Critical Integrations Case</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>Director_of_Integrations</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>Integrations</recipient>
            <type>role</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>System_Email_Alerts/Critical_Integrations_Case</template>
    </alerts>
    <alerts>
        <fullName>INT_Level_3</fullName>
        <description>INT - Level 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>jezelle@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>saara@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>wclifford@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Case_Escalation</template>
    </alerts>
    <alerts>
        <fullName>Integrations_Notification_of_case_creation</fullName>
        <description>Integrations_Notification of case creation to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>SuppliedEmail</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>Integration</recipient>
            <type>group</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Automation_emails/Integrations_Notification_of_case_creation</template>
    </alerts>
    <alerts>
        <fullName>Integrations_Notification_of_case_creation_to_Case_owner_from_INT_team</fullName>
        <description>Integrations_Notification of case creation to Case owner from INT team</description>
        <protected>false</protected>
        <recipients>
            <recipient>Integration</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Automation_emails/CASE_Integration_Case_creation</template>
    </alerts>
    <alerts>
        <fullName>NMG_Support_Case_creation</fullName>
        <description>Automated response to NMG team every time case is created</description>
        <protected>false</protected>
        <recipients>
            <recipient>acasubolo@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jack@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lauren@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Automation_emails/CASE_NMG_Support_Case_creation</template>
    </alerts>
    <alerts>
        <fullName>New_Customer_Support_Case</fullName>
        <description>New Customer Support Case</description>
        <protected>false</protected>
        <recipients>
            <recipient>ab_joor@ct.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Customer_Support_Case</template>
    </alerts>
    <alerts>
        <fullName>RSM_Level_3</fullName>
        <description>RSM - Level 3</description>
        <protected>false</protected>
        <recipients>
            <recipient>jezelle@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>lauren@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>saara@jooraccess.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Case_Escalation</template>
    </alerts>
    <alerts>
        <fullName>When_a_case_has_been_status_New_for_2_hours</fullName>
        <description>Case has been in status New for 2 hours</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Automation_emails/CASE_New_case_for_2_hours</template>
    </alerts>
    <alerts>
        <fullName>X2_hours_notification</fullName>
        <ccEmails>bea@jooraccess.com</ccEmails>
        <ccEmails>wclifford@jooraccess.com</ccEmails>
        <ccEmails>lawrence@jooraccess.com</ccEmails>
        <ccEmails>ktzeng@jooraccess.com</ccEmails>
        <ccEmails>gkim@jooraccess.com</ccEmails>
        <description>2+ hours notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/X2_hours_notification</template>
    </alerts>
    <alerts>
        <fullName>X48_hours_notification</fullName>
        <ccEmails>bea@jooraccess.com</ccEmails>
        <ccEmails>wclifford@jooraccess.com</ccEmails>
        <ccEmails>lawrence@jooraccess.com</ccEmails>
        <ccEmails>ktzeng@jooraccess.com</ccEmails>
        <ccEmails>gkim@jooraccess.com</ccEmails>
        <description>48+ hours notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>joortesting@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/X8_hours_notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>CASE_Description_update</fullName>
        <field>Description</field>
        <formula>Description_for_pre_chat_form__c</formula>
        <name>CASE: Description update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CASE_update_Case_reason_for_Retail_team</fullName>
        <field>Reason</field>
        <literalValue>Retailer Applications</literalValue>
        <name>CASE: Update Case reason for Retail team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CSM_type</fullName>
        <field>Type</field>
        <literalValue>CSM</literalValue>
        <name>CSM type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Origin</fullName>
        <field>Origin</field>
        <literalValue>bonjour@jooraccess.com</literalValue>
        <name>Case Origin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_Type_Integrations</fullName>
        <field>Type</field>
        <literalValue>Integrations</literalValue>
        <name>Case Type - Integrations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Case_owner_change_to_INT</fullName>
        <field>OwnerId</field>
        <lookupValue>Integrations</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Case owner change to INT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_owner_from_Queue_to_user</fullName>
        <description>set up all incoming emails to this Queue (Retail App) to automatically assign to the user Victoria Sorge</description>
        <field>OwnerId</field>
        <lookupValue>tetyana.krupchenko@jooraccess.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>CASE: Change owner from Queue to user</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Delete_Description_on_Case_Creation</fullName>
        <field>Description</field>
        <name>Delete Description on Case Creation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Integrations_type</fullName>
        <field>Type</field>
        <literalValue>Integrations</literalValue>
        <name>Integrations type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LCT</fullName>
        <field>Origin</field>
        <literalValue>Chat</literalValue>
        <name>LCT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product_Support</fullName>
        <field>Type</field>
        <literalValue>Product Support</literalValue>
        <name>Product Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RSM_type</fullName>
        <field>Type</field>
        <literalValue>RSM</literalValue>
        <name>RSM type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Case_Priority_to_High</fullName>
        <description>Changes the Priority of a Case to High.</description>
        <field>Priority</field>
        <literalValue>High</literalValue>
        <name>Set Case Priority to High</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_update</fullName>
        <description>Change type acording to the case owner</description>
        <field>Type</field>
        <literalValue>Product Support</literalValue>
        <name>Update_type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Reason</fullName>
        <field>Reason</field>
        <literalValue>Customer Data Update</literalValue>
        <name>Update Case Reason</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Type</fullName>
        <field>Type</field>
        <literalValue>CSM</literalValue>
        <name>Update Case Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_origin_LCT</fullName>
        <field>Origin</field>
        <literalValue>Chat</literalValue>
        <name>Update_Case_origin_LCT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_after_Customer_comment</fullName>
        <field>Customer_Last_Response_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Date after Customer comment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>Support_CSM</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Priority</fullName>
        <field>Priority</field>
        <literalValue>Medium</literalValue>
        <name>Update Priority</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Record_type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Product_Support</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update_Record type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Record_type_CSM</fullName>
        <field>RecordTypeId</field>
        <lookupValue>CSM</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update_Record type CSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <field>Status</field>
        <literalValue>Done_Confirmed_With_Client</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_type_CSM</fullName>
        <field>Type</field>
        <literalValue>CSM</literalValue>
        <name>Update_type_CSM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>%22Case Type%22 should be %27Integrations%27</fullName>
        <actions>
            <name>Case_Type_Integrations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>integrations@jooraccess.com</value>
        </criteriaItems>
        <description>If the &quot;Case Origin&quot; is &apos;integrations@jooraccess.com&apos; then the &quot;Case Type&quot; should be &apos;Integrations&apos;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Chage Type based on Case owner_CSM</fullName>
        <actions>
            <name>CSM_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp; OwnerId = &apos;00G0x000000GiLL&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Chage Type based on Case owner_Integrations</fullName>
        <actions>
            <name>Integrations_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp;(OwnerId = &apos;00G0x000000GiL1&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Chage Type based on Case owner_Product_Support</fullName>
        <actions>
            <name>Product_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp; or (OwnerId = &apos;00G0x000000GiL6&apos;, OwnerId = &apos;00G0x000000GiLB&apos;, OwnerId = &apos;00G0x000000GiLG&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Chage Type based on Case owner_RSM</fullName>
        <actions>
            <name>RSM_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId) &amp;&amp; or (OwnerId = &apos;00G0x000000Gv8u&apos;, OwnerId = &apos;00G0x000000Gv8p&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A In Progress_for_24_hours</fullName>
        <active>true</active>
        <description>Send a notification to Integration team when a case has status In Progress for 24 hours</description>
        <formula>ISPICKVAL( Origin , &apos;integrations@jooraccess.com&apos;) &amp;&amp; OwnerId &lt;&gt; &apos;00G0x000000GiL1&apos; &amp;&amp;  ISPICKVAL (Status, &apos;In Progress&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Case_has_been_in_status_In_Progress_for_6_hours</name>
                <type>Alert</type>
            </actions>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A In Progress_for_24_hours Retail team</fullName>
        <actions>
            <name>Case_has_been_in_status_In_Progress_for_24_hours_Retail</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send a notification to Retail team when a case has status In Progress for 24 hours</description>
        <formula>ISPICKVAL( Origin , &apos;retail@jooraccess.com&apos;) &amp;&amp; OwnerId &lt;&gt; &apos;00G0x000000Gv8p&apos; &amp;&amp;  ISPICKVAL (Status, &apos;In Progress&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Integration_Case notification of creation</fullName>
        <actions>
            <name>Integrations_Notification_of_case_creation_to_Case_owner_from_INT_team</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>info@jooraccess.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>00G46000000Z3C0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>00G46000000Z3C1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>00G46000000Z3Be</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Automated response every time incoming case is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Integrations_Case notification of creation to Customer</fullName>
        <actions>
            <name>Integrations_Notification_of_case_creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>integrations@jooraccess.com</value>
        </criteriaItems>
        <description>Automated response to Customer every time incoming case is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A JDT_Case notification of closure</fullName>
        <actions>
            <name>CASE_JDT_Notification_of_case_closure</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>assets@jooraccess.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <description>Automated response when case is closed</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A JDT_Case notification of creation</fullName>
        <actions>
            <name>CASE_JDT_Notification_of_case_creatio</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>assets@jooraccess.com</value>
        </criteriaItems>
        <description>Automated response every time incoming case is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A NMG support_Case notification of creation</fullName>
        <actions>
            <name>NMG_Support_Case_creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Automated response every time incoming case is created</description>
        <formula>ISPICKVAL( Origin , &apos;nmgsupport@jooraccess.com&apos;) &amp;&amp; OwnerId &lt;&gt; &apos;00G0x000000Gv8u&apos;  &amp;&amp; ISPICKVAL (Status, &apos;New&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A New case Retail_assign to Victoria Sorge</fullName>
        <actions>
            <name>CASE_update_Case_reason_for_Retail_team</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_owner_from_Queue_to_user</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISPICKVAL( Origin , &apos;retail@jooraccess.com&apos;) &amp;&amp; OwnerId = &apos;00G0x000000Gv8p&apos;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A New_for_48_hours_Retail team</fullName>
        <active>true</active>
        <description>Send a notification when a case has status New for 48 hours to Retail team</description>
        <formula>ISPICKVAL( Origin , &apos;retail@jooraccess.com&apos;) &amp;&amp;  ISPICKVAL (Status, &apos;New&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>48</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A New_for_4_hours</fullName>
        <active>false</active>
        <description>Send a notification when a case has status New for 4 hours to CSM and RSM teams</description>
        <formula>OR (ISPICKVAL( Origin , &apos;nmgsupport@jooraccess.com&apos;),  ISPICKVAL( Origin , &apos;info@jooraccess.com&apos;),  ISPICKVAL( Origin , &apos;bonjour@jooraccess.com&apos;), ISPICKVAL( Origin, &apos;support@jooraccess.com&apos;), ISPICKVAL( Origin, &apos;buyer@jooraccess.com&apos;) ) &amp;&amp;  

OwnerId &lt;&gt; &apos;00G0x000000GiL1&apos; &amp;&amp;   
OwnerId &lt;&gt; &apos;00G0x000000GiLL&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000GiL6&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000Gv8u&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000Gv8p&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000GiLG&apos; &amp;&amp;  
OwnerId &lt;&gt; &apos;00G0x000000UaQK&apos; &amp;&amp;  

ISPICKVAL (Status, &apos;New&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>CASE_RSM_New_status</name>
                <type>Alert</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A New_for_4_hours_Integration team</fullName>
        <active>true</active>
        <description>Send a notification when a case has status New for 4 hours to Integration team</description>
        <formula>ISPICKVAL( Origin , &apos;integrations@jooraccess.com&apos;) &amp;&amp; OwnerId = &apos;00G0x000000GiL1&apos; &amp;&amp;  ISPICKVAL (Status, &apos;New&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Case_has_been_in_status_New_for_4_hours_Integrations</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A No response from end-user</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Progress,Waiting on Customer</value>
        </criteriaItems>
        <description>When case has not received a response from the end-user in 48 hours (8 days )</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Case_has_not_received_a_response_for_48_hours</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.End_User_Last_Response_Date__c</offsetFromField>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A Notification about customer reply to case owner</fullName>
        <active>true</active>
        <description>Integrations receive an email every time a customer replies to a case</description>
        <formula>ISPICKVAL( Origin , &apos;integrations@jooraccess.com&apos;) &amp;&amp; OwnerId &lt;&gt; &apos;00G0x000000GiL1&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>CASE_Comments_from_customer_Integrations</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.Customer_Last_Response_Date__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A Notification for not closed Case in 48 h</fullName>
        <active>false</active>
        <description>Send a notification when case has not been set to Status: Closed in 48 hours to CSM and RSM teams</description>
        <formula>OR (
ISPICKVAL( Origin , &apos;info@jooraccess.com&apos;),  
ISPICKVAL( Origin , &apos;bonjour@jooraccess.com&apos;), 
ISPICKVAL( Origin, &apos;support@jooraccess.com&apos;), 
ISPICKVAL( Origin, &apos;buyer@jooraccess.com&apos;), 
ISPICKVAL( Origin, &apos;nmgsupport@jooraccess.com&apos;) 
) &amp;&amp;  

OwnerId &lt;&gt; &apos;00G0x000000GiL1&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000GiLL&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000GiL6&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000Gv8u&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000Gv8p&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000GiLG&apos; &amp;&amp; 
OwnerId &lt;&gt; &apos;00G0x000000UaQK&apos; &amp;&amp; 

!ISPICKVAL (Status, &apos;Closed&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Case_has_not_been_Closed_in_48_hours</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.CreatedDate</offsetFromField>
            <timeLength>48</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>CASE%3A Type</fullName>
        <actions>
            <name>Type_update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>bonjour@jooraccess.com,support@jooraccess.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Jezelle Bosch,Saara Lankarani</value>
        </criteriaItems>
        <description>Type is defined based on Case Owner - if Case Owner is Jezelle Bosch or Saara Lankarani, Type is Product Support, If Case Owner is anyone else (will be on CSM team), Type is CSM</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Type CSM</fullName>
        <actions>
            <name>Update_Record_type_CSM</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_type_CSM</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>bonjour@jooraccess.com,support@jooraccess.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>notEqual</operation>
            <value>Jezelle Bosch,Saara Lankarani</value>
        </criteriaItems>
        <description>Type is defined based on Case Owner - If Case Owner is anyone else from CSM team, Type is CSM</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CASE%3A Update Description field form pre-chat form</fullName>
        <actions>
            <name>CASE_Description_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISNULL( Description_for_pre_chat_form__c ) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Origin</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>RSM</value>
        </criteriaItems>
        <description>If the &quot;Case Type&quot; = &quot;RSM&quot; 
then &quot;Case Origin&quot; should display the following fields in the dropdown:

Email - retail@ 
Email - nmgsupport@ 
Phone 
In Person Meeting</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Closing Data Submission Portal Cases</fullName>
        <actions>
            <name>Case_Origin</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Case_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Priority</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>EmailMessage.ToAddress</field>
            <operation>equals</operation>
            <value>bonjour@jooraccess.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>EmailMessage.TextBody</field>
            <operation>contains</operation>
            <value>Thank you for submitting your assets to JOOR. Your request has been received by the Data Services team.</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Critical Integrations Case</fullName>
        <actions>
            <name>Critical_Integrations_Case</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Integrations</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Critical__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Fires when an Integrations Case is marked Critical.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Support Cases</fullName>
        <actions>
            <name>New_Customer_Support_Case</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>$User.Id  = &apos;0050x000000HTsw&apos;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email to Case%3A Delete Description on Case Creation</fullName>
        <actions>
            <name>Delete_Description_on_Case_Creation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Description</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Deletes the case description when a new email-to-case case is created.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Key Account Cases Marked High Priority</fullName>
        <actions>
            <name>Set_Case_Priority_to_High</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Whenever a Case is edited and the Account it&apos;s related to is a Key Account, the Priority will be changed to High.</description>
        <formula>Key_Account__c = TRUE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
