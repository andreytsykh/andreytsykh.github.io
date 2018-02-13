/**
 * Created by Valera on 22.01.2018.
 */

public with sharing class CaseService {

    public static final String CONTACT_NAME = 'JOOR Web User';
    public static final String ACOUNT_NAME = 'JOOR Retail Web Users';
    public static final String EMAIL_ORIGEN = 'retail@jooraccess.com';

    //    private static final String NAME_GROUPE = Label.QueueGroupe;
    public static void assigningUsers(List<Case> cases, Round_robin__c round_robin) {
        Map<Id, Group> namesGroupe = getMapCaseGroup(cases);
        if (namesGroupe.isEmpty())
            return;
        List<User> loopList = getCurrentMembers(round_robin);
        round_robin = checkLastUser(round_robin, loopList);
        String lastUserId = round_robin.last_user__c;
        String nameQueue = round_robin.list_Queue__c;
        if (loopList.isEmpty() | String.isBlank(nameQueue)) {
            return;
        }
        List<User> loopForCases = userForRR(loopList, cases);
        String idsGRP = idQueue(round_robin.list_Queue__c);
        if (String.isBlank(idsGRP))
            return ;

        for (Case currentCase : cases) {
            if ((namesGroupe.get(currentCase.Id).Id == idsGRP)) {
                if (loopForCases.size() == 1) {
                    currentCase.OwnerId = loopForCases.get(0).Id;
                } else {
                    for (Integer j = 0; j < loopForCases.size(); j++) {
                        if (loopForCases.get(j).Id == lastUserId) {
                            if ((j + 1) < loopForCases.size()) {
                                currentCase.OwnerId = loopForCases.get(j + 1).Id;
                                lastUserId = loopForCases.get(j + 1).Id;
                                break;
                            } else {
                                currentCase.OwnerId = loopForCases.get(0).Id;
                                lastUserId = loopForCases.get(0).Id;
                                break;
                            }
                        }
                    }

                }
            }
        }
        round_robin.last_user__c = lastUserId;
        upsert round_robin;
        System.debug('Last User : ' + lastUserId);
        System.debug('Cases After RR : ' + cases);
//        insert cases;
    }

    public static String idQueue(String nameQueue) {
        List<Group> idsGRP = [SELECT Id FROM Group WHERE DeveloperName = :nameQueue ORDER BY ID];
        if (!idsGRP.isEmpty()) {
            return idsGRP.get(0).Id;
        }
        return null;

    }

    public static List<User> userForRR(List<User> loopList, List<Case> cases) {
        List<User> loopForCases = new List<User>(loopList);
        Integer countRepeat = 0;
        if (loopForCases.size() > 1) {
            countRepeat = cases.size() / loopForCases.size();
        }
        if (countRepeat > 0) {
            for (Integer i = 1; i < (Integer) (countRepeat + 1); i++) {
                loopForCases.addAll(loopList);
            }
        }
        return loopForCases;
    }

    public static Round_robin__c checkLastUser(Round_robin__c round_robin, List<User> loopList) {
        String lastUserId = round_robin.last_user__c;
        Boolean checker = false;
        for (User user : loopList) {
            if (user.Id == lastUserId) {
                checker = true;
            }
        }
        if (checker == false) {
            round_robin.last_user__c = loopList.get(0).Id;
        }
        upsert round_robin;
        return round_robin;
    }

    public static Map<id, Group> getMapCaseGroup(List<Case> cases) {
        Map<Id, Group> namesGroupe = new Map<Id, Group>();

        Set<Id> idGroupe = new Set<Id>();
        for (Case ids : cases) {
            idGroupe.add(ids.OwnerId);
        }
        System.debug('AFTER SET' + idGroupe);
        List<Group> groups = [SELECT id, DeveloperName FROM Group WHERE Id IN:idGroupe];
        System.debug('GROUP : ' + groups);
        for (Case caseMap : cases) {
            Group newGroup = new Group();
            for (Group grp : groups) {
                if (caseMap.OwnerId == grp.Id) {
                    newGroup = grp;
                    namesGroupe.put(caseMap.Id, newGroup);
                }
            }
        }
        return namesGroupe;
    }


    public static List<User> getCurrentMembers(Round_robin__c round_robin) {
//        Set<Id> idGrp = [SELECT id]
        List<GroupMember> members = selectorGroupMember(round_robin.list_Queue__c);
        System.debug('--->>>>MEMBERS ' + members);
        Set<Id> ids = idsUsers(members);
        List<User> users = selectorUsers(ids, round_robin);
        return users;
    }

    //get List of Queue from custom Setting
    public static List<String> namesQueue(String str) {
        String[] nameSpace = str.split(',');
        Integer counter = 0;
        for (String name : nameSpace) {
            nameSpace[counter] = name.trim();
            counter++;
        }
        return nameSpace;
    }

    public static Set<Id> idsUsers(List<GroupMember> members) {
        Set<Id> ids = new Set<Id>();
        for (GroupMember groupMember : members) {
            ids.add(groupMember.UserOrGroupId);
        }
        return ids;
    }

    public static List<User> selectorUsers(Set<Id> ids, Round_robin__c round_robin) {
        List<String> nightIds = namesQueue(round_robin.night_users__c);
        if (round_robin.time_day__c) {
            return [
                    SELECT id
                            , Name
                    FROM User
                    WHERE Id IN:ids
                    AND Id NOT IN:nightIds
                    ORDER BY Id
            ];
        } else {
            return [
                    SELECT id
                            , Name
                    FROM User
                    WHERE Id IN:nightIds
                    ORDER BY Id
            ];
        }
    }

    public static List<GroupMember> selectorGroupMember(String nameQueue) {
        return [
                SELECT UserOrGroupId
                FROM GroupMember
                WHERE GroupId IN (
                        SELECT Id
                        FROM Group
                        WHERE Type = :Label.Type_Queue
                        AND DeveloperName = :nameQueue
                )
                ORDER BY UserOrGroupId
        ];
    }

    public static Round_robin__c getRoundRobin(List<Case> cases) {
        Set<Id> idCases = new Set<Id>();
        for (Case caseCurrent : cases) {
            idCases.add(caseCurrent.OwnerId);
        }
        List<Group> groups = [SELECT id, DeveloperName FROM Group WHERE Id IN:idCases];
        if (groups.isEmpty())
            return null;
        System.debug('GROUP' + groups);
        Round_robin__c robin = CustomSettingManager.getRoundRobin(groups.get(0).DeveloperName);
        if (robin != null)
            return robin;
        return null;
    }


    /**
    Assingning AccountId and ContactId
     */

    public static void assingingContactsAndAccounts(List<Case> cases) {
        Contact oneContact = [
                SELECT id
                        , Name
                FROM Contact
                WHERE Name = :CONTACT_NAME
                LIMIT 1
        ];
        Account oneAccount = [
                SELECT id
                        , Name
                FROM Account
                WHERE name = :ACOUNT_NAME
                LIMIT 1
        ];
        for (Case cs : cases) {
            if (cs.Origin == EMAIL_ORIGEN) {
                cs.ContactId = oneContact.Id;
                cs.AccountId = oneAccount.Id;
            }
        }

        List<String> webEmail = new List<String>();
        for (Case cs : cases) {
            if (String.isBlank(cs.SuppliedEmail))
                continue;
            webEmail.add(cs.SuppliedEmail);
        }

        if (webEmail.isEmpty())
            return;

        List<Contact> contacts = [
                SELECT Id
                        , AccountId
                        , Email
                FROM Contact
                WHERE Email IN:webEmail
        ];

        if (contacts.isEmpty())
            return;
        for (Case cs : cases) {
            for (Contact cnt : contacts) {
                if (cnt.Email == cs.SuppliedEmail && cs.Origin != EMAIL_ORIGEN) {
                    cs.ContactId = cnt.Id;
                    if (cnt.AccountId != null)
                        cs.AccountId = cnt.AccountId;
                }
            }
        }
    }
}