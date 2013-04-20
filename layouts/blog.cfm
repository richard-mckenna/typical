<cfoutput>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        
		<!--- Title --->
		<title>
			<cfif cb.isEntryView()>
				#cb.getCurrentEntry().getTitle()#
			<cfelse>
				#cb.siteName()# - #cb.siteTagLine()#
			</cfif>
		</title>
        
		<!--- Copyright --->
        <meta name="author" content="Richard McKenna">
        <meta name="copyright" content="Richard McKenna">
        
		<!--- Robots --->
		<meta name="generator" 	 content="ContentBox powered by ColdBox" />
		<meta name="robots" content="noindex,nofollow" />
		
		<!--- SES --->
		<base href="#cb.siteBaseURL()#" />
		
		<!--- Meta Description By Page or By Site --->
		<cfif cb.isEntryView() and len(cb.getCurrentEntry().getHTMLDescription())>
			<meta name="description" content="#cb.getCurrentEntry().getHTMLDescription()#" />
		<cfelse>
			<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
		</cfif>
		<!--- Meta Keywords By Page or By Site --->
		<cfif cb.isEntryView() and len(cb.getCurrentEntry().getHTMLKeywords())>
			<meta name="keywords" content="#cb.getCurrentEntry().getHTMLKeywords()#" />
		<cfelse>
			<meta name="keywords" content="#cb.siteKeywords()#" />
		</cfif>

		<!--- Favicon --->
		<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />		
		
        <meta name="viewport" content="width=device-width">
		
		<!--- RSS Links --->
		<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
		<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
		<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
		<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
		<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
		<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />	
		<!--- RSS Discovery If In View Mode --->
		<cfif cb.isPageView()>
			<link rel="alternate" type="application/rss+xml" title="Pages's Recent Comments" href="#cb.linkPageRSS(comments=true,page=cb.getCurrentPage())#" />
		</cfif>
		
		<!--- StyleSheets --->
        <link rel="stylesheet" href="#cb.layoutRoot()#/includes/styles/vendor/bootstrap.css">
        <link rel="stylesheet" href="#cb.layoutRoot()#/includes/styles/styles.css">
		
		<!--- JavaScript --->
        <script src="#cb.layoutRoot()#/includes/javascript/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
		<script src="#cb.layoutRoot()#/includes/javascript/vendor/jquery-1.9.0.min.js"></script>
		<script src="#cb.layoutRoot()#/includes/javascript/vendor/bootstrap.min.js"></script>
		
		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#
    
    </head>
    <body>
	    
		<!--- ContentBoxEvent --->
		#cb.event("cbui_afterBodyStart")#
			
		<div id="main-container" class="container">
			
			<div class="row">
				<header id="header" class="span24">
					<div id="site-logo" class="pull-left">
						#cb.siteName()#
					</div>
					<nav id="main-nav" class="pull-right">
						#cb.quickView('_menu')#
					</nav>
				</header>
			</div>
			
			<cfif prc.currentroute eq "/">
				
				<div class="row">
					#cb.widget("FeaturedEntry")#
				</div>
				
				<div class="row">
					
					<!--- contentboxEvent --->
					#cb.event("cbui_beforeContent")#
					
					<section id="main-content" class="span18">
						#cb.widget("OffsetEntries")#
					</section>
					<aside id="side-content" class="span5 offset1">
						#cb.quickView(view='_sidebar')#
					</aside>
					
					<!--- ContentBoxEvent --->
					#cb.event("cbui_afterContent")#
					
				</div>
			
			<cfelse>
						
				<div class="row">
					
					<!--- contentboxEvent --->
					#cb.event("cbui_beforeContent")#
					
					<section id="main-content" class="span18">
						#cb.mainView()#
					</section>
					<aside id="side-content" class="span5 offset1">
						#cb.quickView(view='_sidebar')#
					</aside>
					
					<!--- ContentBoxEvent --->
					#cb.event("cbui_afterContent")#
					
				</div>
			
			</cfif>

			<div class="push"></div>
			
		</div>
		
		<footer id="footer">
			<div class="container">
				
				<!--- ContentBoxEvent --->
				#cb.event("cbui_footer")#
				
				<div class="pull-left">
					Copyright &copy; 2013 Richard McKenna
				</div>
				
				<div class="pull-right">
					Powered by ContentBox and the ColdBox Platform
				</div>
				
			</div>
		</footer>
		
		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeBodyEnd")#
		
    </body>
</html>
</cfoutput>
