/**
* A cool basic widget that shows our blog archives
*/
component extends="contentbox.model.ui.BaseWidget" singleton {
		
	function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("Featured Entry");
		setPluginVersion("1.0");
		setPluginDescription("A widget to display the latest entry as a feature");
		setPluginAuthor("Richard McKenna");
		setPluginAuthorURL("http://www.richard-mckenna.com");
		setIcon( "calendar.png" );
		setCategory( "Blog" );
		return this;
	}

	/**
	* Show the blog archives
	* @dropdown.hint Display as a dropdown or a list, default is list
	* @showPostCount.hint Show post counts or not, default is true
	* @title.hint The title to show before the dropdown or list, defaults to H2
	* @titleLevel.hint The H{level} to use, by default we use H2
	*/
	any function renderIt(boolean fullwidth=true){
		var featuredEntry	= entryService.findPublishedEntries(max=1).entries[1];
		var rString			= "";
		/*writeDump(var=featuredEntry);
		abort;*/
		saveContent variable="rString"{
			writeoutput('
				<article class="span24 featured-article">
					<h2>Featured Article: <a href="#cb.linkEntry(featuredEntry)#">#featuredEntry.getTitle()#</a></h2>
					<div class="article-content">
						#featuredEntry.getExcerpt()#
					</div>
					<ul class="article-menu">
						<li><strong>#dateFormat(featuredEntry.getPublishedDate(),"dd mmmm, yyyy")#</strong></li>
						<li>#cb.quickCategoryLinks(featuredEntry)#</li>
			');
			if ( featuredEntry.getAllowComments() ) {
				writeoutput('
					<li>#featuredEntry.getNumberOfApprovedComments()# Comments</li>
				');
			}
			writeoutput('
					</ul>
				</article>
			');
		}
		
		return rString;
	}

}
