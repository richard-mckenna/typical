<cfoutput>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_preEntryDisplay")#
	
	<!--- top gap --->
	<!---<div class="post-top-gap"></div>--->
	
	<!--- Quickly reuse our entry template to build this one with some extra pizzaz --->
	#cb.quickEntry()#
	
	<!--- Display Comments --->
	<div id="comments">
		<h2>#prc.entry.getNumberOfApprovedComments()# Comments</h2>
		#cb.quickComments()#
	</div>
	
	<!--- Comment Form: I can build it or I can quick it? --->
	<div id="commentFormShell" class="span20">
		#cb.quickCommentForm(prc.entry)#
	</div>
	
	<div class="clr"></div>
	
	
		
	<!--- ContentBoxEvent --->
	#cb.event("cbui_postEntryDisplay")#
	

<!--- Custom JS For Comments--->
<cfif cb.isCommentsEnabled()>
<script>
$(document).ready(function() {

});

</script>
</cfif>
</cfoutput>