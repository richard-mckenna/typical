<cfoutput>
<!--- post --->
<article class="article" id="post_#entry.getContentID()#">
	<h2><a href="#cb.linkEntry(entry)#" rel="bookmark" title="#entry.getTitle()#">#entry.getTitle()#</a></h2>
	<div class="row">
		<div class="span4">
			<ul class="article-menu">
				<li><strong>#dateFormat(entry.getPublishedDate(),"dd mmmm, yyyy")#</strong></li>
				<li>#cb.quickCategoryLinks(entry)#</li>
				<cfif cb.isCommentsEnabled(entry)>
					<li>#entry.getNumberOfApprovedComments()# Comments</li>
				</cfif>
			</ul>
		</div>
		<div class="span20 article-content">
			<!--- excerpt or content --->
			<cfif entry.hasExcerpt() >
				#entry.getExcerpt()#&nbsp;
			<cfelse>
				<!--- Don't get the excerpt, render the content --->
				#entry.renderContent()#
			</cfif>
		</div>
	</div>
</article>
</cfoutput>