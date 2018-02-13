/**
 * Created by Valera on 02.01.2018.
 */

public with sharing class CategoryTypes {
    public String text{get;set;}
    public List<Children_Z> children{get;set;}

    public class Children_Z {
        public String name{get;set;}
        public String text{get;set;}
        public List<Children> children{get;set;}
    }

    public class Children {
        public String name{get;set;}
        public String text{get;set;}
        public Object children{get;set;}
    }


    public static CategoryTypes parse(String json) {
        return (CategoryTypes) System.JSON.deserialize(json, CategoryTypes.class);
    }

    public static Children_Z parseChildren_Z(String json) {
        return (Children_Z) System.JSON.deserialize(json, Children_Z.class);
    }

}