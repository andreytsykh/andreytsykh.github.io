({
	getCategoryAPIName : function() {
		console.log(document.location.href);
		console.log(document.location.href.split("/"));
		var hrefArray = document.location.href.split("/");
		return hrefArray[hrefArray.length - 1];
	}
})