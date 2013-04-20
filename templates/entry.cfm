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
			<cfif cb.setting('cb_layout_typical_addThis') neq "" and !cb.isIndexView()>
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_16x16_style pull-right">
					<a class="addthis_button_google_plusone_share"></a>
					<a class="addthis_button_twitter"></a>
					<a class="addthis_button_facebook"></a>
					<a class="addthis_button_pinterest_share"></a>
					<a class="addthis_button_email"></a>
					<a class="addthis_button_print"></a>
				</div>
				<script src="//s7.addthis.com/js/300/addthis_widget.js##pubid=ra-502958292e4ef2b1"></script>
				<!-- AddThis Button END -->
			</cfif>
		</div>
		<div class="span20 article-content">
			<!--- excerpt or content --->
			<cfif entry.hasExcerpt() and cb.isIndexView()>
				#entry.getExcerpt()#&nbsp;
			<cfelse>
				<!--- Don't get the excerpt, render the content --->
				#entry.renderContent()#
			</cfif>
		</div>
	</div>
</article>
</cfoutput>