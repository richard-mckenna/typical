<cfoutput>
<cfif category.getNumberOfEntries()>
	<!--- Mini RSS --->
	<!---<a class="floatRight" href="#cb.linkRSS(category=category)#" title="RSS Feed For #category.getCategory()#"><img src="#cb.layoutRoot()#/includes/images/mini-rss.gif" alt="rss" border="0"/></a>--->
	<!--- Category --->
	<li><a href="#cb.linkCategory(category)#" title="Filter by #category.getCategory()#">#category.getCategory()#</a> (#category.getNumberOfEntries()#)</li>
</cfif>
</cfoutput>