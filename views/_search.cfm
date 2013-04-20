<cfoutput>
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
</cfoutput>				
