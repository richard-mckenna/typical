/**
* A cool basic widget that shows our blog archives
*/
component extends="contentbox.model.ui.BaseWidget" singleton {
		
	function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("Offset Entries");
		setPluginVersion("1.0");
		setPluginDescription("A widget to display entries offset by count.");
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
	any function renderIt(template="entry",collectionAs="entry",args=structnew()){
		var entries = entryService.findPublishedEntries(offset=1,max=5).entries;
		
		return renderView(view="#cb.layoutName()#/templates/#arguments.template#",collection=entries,collectionAs=arguments.collectionAs,args=arguments.args);;
	}

}
