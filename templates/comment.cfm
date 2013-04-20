<cfoutput>
<!---<div id="comment_#comment.getCommentID()#" class="comment">
	<!--- Anchor --->
	<a name="comment_#comment.getCommentID()#"></a>
	
	<!--- Comment Avatar --->
	<div class="commentPicture">
		#cb.quickAvatar(author=comment.getAuthorEmail(),size=60)#
	</div>
	
	<!--- Comment Author --->
	<h4>
		<cfif len(comment.getAuthorURL())>
			<a href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#" title="Open #comment.getAuthorURL()#"><img src="#cb.layoutRoot()#/includes/images/link.png" alt="url" border="0" /></a>
		</cfif>
		<strong>#comment.getAuthor()#</strong> said
	</h4>
	<p>at #comment.getDisplayCreatedDate()#</p>
	
	<!--- Content --->
	<div class="commentContent">
		#comment.getDisplayContent()#
	</div>
</div>--->
<article class="comment" id="comment_#comment.getCommentID()#">
	<div class="row">
		<div class="span4">
			<ul class="comment-details">
				<li>
					<strong>
						#dateFormat(comment.getCreatedDate(), "dd mmmm, yyyy")#<br>
						#timeFormat(comment.getCreatedDate(), "H:mm TT")#
					</strong>
				</li>
				<li><strong>By</strong>&nbsp;<cfif len(comment.getAuthorURL())><a href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#" title="Open #comment.getAuthorURL()#">#comment.getAuthor()#</a><cfelse>#comment.getAuthor()#</cfif></li>
			</ul>
		</div>
		<div class="span2">
			#cb.quickAvatar(author=comment.getAuthorEmail(),size=60)#
		</div>
		<div class="span18 comment-content">
			#comment.getDisplayContent()#
		</div>
	</div>
</article>
</cfoutput>