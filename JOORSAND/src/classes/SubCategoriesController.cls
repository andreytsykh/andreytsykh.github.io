public class SubCategoriesController {
	
	private static Map<String, String> describeMap;
	
	@AuraEnabled
	public static List<SubCategory> getSubCategories(String categoryName) {
		
		Set<Id> articleIds = new Set<Id>();
		List<SubCategory> SubCategoryList = new List<SubCategory>();
		createDescribeMap();
		
		List<Knowledge__DataCategorySelection> dataCategorySelections = [SELECT id, ParentId, DataCategoryName, DataCategoryGroupName FROM Knowledge__DataCategorySelection];
		
		for (Knowledge__DataCategorySelection selection : dataCategorySelections) {
			if (selection.DataCategoryName.toLowerCase() == categoryName) {
				articleIds.add(selection.ParentId);
			}
		}
		
		for (Id articleId : articleIds) {
			SubCategoryList.add(new SubCategory(getArticleType(articleId)));
		}
		
		return SubCategoryList;
	}
	
	private static void createDescribeMap() {
		describeMap = new Map<String, String>();
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Set<String> keySet = gd.keySet();
        for (String key : keySet) {
            Schema.SObjectType objectType = gd.get(key);
            if (key.endsWith('ka') || key.endsWith('kb')) {
                describeMap.put(objectType.getDescribe().getKeyPrefix(), objectType.getDescribe().getLabel());
            }
        }
    }
    
    public static String getArticleType(String articleId) {
        String articlePrefix = articleId.substring(0,3);
        Set<String> keySet = describeMap.keySet();
        String articleType = null;
        for (String key: keySet) {
            if (articlePrefix.equalsIgnoreCase(key)) {
                articleType = describeMap.get(key);
                return articleType;
            }
        }
        return articleType;
    }
    
    public class SubCategory {
    	
    	@AuraEnabled
    	public String name {get; set;}
    	
    	public SubCategory(String name) {
    		this.name = name;
    	}
    }
    
}