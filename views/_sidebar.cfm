<cfoutput>
<!--- ContentBoxEvent --->
#cb.event("cbui_BeforeSideBar")#

<section id="social-media">
	<h3>Social</h3>
	<a href=""><i class="typicon-google-"></i></a>
	<a href=""><i class="typicon-twitter-4"></i></a>
	<a href=""><i class="typicon-facebook-2"></i></a>
	<a href=""><i class="typicon-linkedin"></i></a>
</section>

<section id="search">
	<h3>Search</h3>
	<form id="searchForm" name="searchForm" method="post" action="#cb.linkContentSearch()#">
		<div class="input-group col-span-7">
			<input name="q" type="text" maxlength="50" value="What are you looking for?" onclick="this.value=''"/>
			<span class="input-group-btn">
				<button class="btn btn-primary search-button" type="button"><i class="glyphicon glyphicon-search"></i></button>
			</span>
		</div>
	</form>
</section>

<section id="categories">
	<h3>Categories</h3>
	<ul class="plain">
		<!--- Display Categories using ContentBox collection template rendering
		the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
		I could have done it manually, but again, why? --->
		#cb.quickCategories()#
	</ul>
</section>

<section id="archives">
	<h3>Archives</h3>
	#cb.widget("Archives")#
	<!---<ul class="plain">
		<li><a href="">April</a> (1)</li>
		<li><a href="">March</a> (2)</li>
		<li><a href="">February</a> (4)</li>
		<li><a href="">January</a> (1)</li>
	</ul>--->
</section>


<!---<h4>Description</h4>
<div class="bg"></div>
<p>#cb.siteDescription()#</p>

#cb.widget("Meta",{titleLevel="4"})#

<h4>Recent Entries</h4>
<div class="bg"></div>
#cb.widget('RecentEntries')#

<h4>Entries Search</h4>
<div class="bg"></div>
#cb.widget(name="SearchForm",args={type="blog"})#
<br/>

<h4>Archives</h4>
<div class="bg"></div>
#cb.widget("Archives")#
<br/>

<!--- RSS Buttons --->
<button class="button" onclick="return to('#cb.linkRSS()#')" title="Subscribe to our Blog RSS Feed!"><img class="topAligned" src="#cb.layoutRoot()#/includes/images/feed.png" alt="feed" /> Blog Updates</button>	
<!--- RSS Entry Comments --->
<cfif cb.isEntryView()>
<button class="button" onclick="return to('#cb.linkRSS(comments=true,entry=prc.entry)#')" title="Subscribe to our Entry's Comment(s) RSS Feed!"><img class="topAligned" src="#cb.layoutRoot()#/includes/images/feed.png" alt="feed" /> Entry Comments</button>	
</cfif>--->

<!--- ContentBoxEvent --->
#cb.event("cbui_afterSideBar")#
</cfoutput>