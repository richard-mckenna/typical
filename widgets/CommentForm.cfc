/**
* A cool basic commenting form for ContentBox
*/
component extends="contentbox.model.ui.BaseWidget" singleton{

	function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("CommentForm");
		setPluginVersion("1.0");
		setPluginDescription("A cool basic commenting form for ContentBox content objects.");
		setPluginAuthor("Ortus Solutions");
		setPluginAuthorURL("http://www.ortussolutions.com");
		setIcon( "comment-add.png" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The main commenting form widget
	* @content.hint The content object to build the comment form for: page or entry
	*/
	any function renderIt(any content){
		var event 		= getRequestContext();
		var cbSettings 	= event.getValue(name="cbSettings",private=true);
		var captcha		= "";
		var commentForm = "";

		// captcha?
		if( cbSettings.cb_comments_captcha ){
			saveContent variable="captcha"{
				writeOutput("
					#getMyPlugin(plugin="Captcha",module="contentbox").display()#&nbsp;
					#html.textField(name="captchacode",class="span3",required="required")#
				");
			}
		}

		// generate comment form
		saveContent variable="commentForm"{
			writeOutput('
				<form name="commentForm" class="form-horizontal" method="post" action="#cb.linkCommentPost(arguments.content)#" novalidate="novalidate">
					#cb.event("cbui_preCommentForm")#
					<div class="row">
						<div class="span18 offset6 commentErrorBox">
							#getPlugin("MessageBox").renderit()#
						</div>
					</div>
					#html.hiddenField(name="contentID",value=arguments.content.getContentID())#
					#html.hiddenField(name="contentType",value=arguments.content.getContentType())#

					<div class="control-group">
						<label class="control-label required" for="author">Name</label>
						<div class="controls span12">
							#html.textField(name="author",required="required",value=event.getValue("author",""))#
						</div>
					</div>
					<div class="control-group">
						<label class="control-label required" for="authorEmail">Email</label>
						<div class="controls span12">
							#html.inputField(name="authorEmail",type="email",required="required",value=event.getValue("authorEmail",""))#
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="authorURL">Website</label>
						<div class="controls span12">
							#html.inputField(name="authorURL",type="url",value=event.getValue("authorURL",""))#
						</div>
					</div>
					<div class="control-group">
						<label class="control-label required" for="content">Comment</label>
						<div class="controls">
							#html.textArea(name="content",required="required",rows="8",value=event.getValue("content",""))#
						</div>
					</div>
					<div class="control-group">
						<label class="control-label requred" for="captchacode">Enter the<br>security code<span class="required">*</span></label>
						<div class="controls">
							#captcha#
						</div>
					</div>

					#cb.event("cbui_postCommentForm")#

					<div class="form-actions">
						#html.submitButton(name="commentSubmitButton",class="btn btn-primary pull-right", value="Submit")#
					</div>
				</form>
			');
		}

		return commentForm;
	}

}
