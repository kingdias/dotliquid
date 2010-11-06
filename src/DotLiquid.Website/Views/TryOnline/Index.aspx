﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
	<div id="content">
		<h1>Try DotLiquid Online</h1>

		<p>This page lets you interactively try out the DotLiquid templating system. It's also proof
		that it's okay to allow your users to edit their own templates - if we trust it so can you!</p>
		<br />

		<h3>Template Code</h3>
		<form action="#">
			<textarea name="templateCode" id="templateCode"><%= ViewData["TemplateCode"] %></textarea>
		</form>
		<br />

		<h3>Result</h3>
		<pre class="result"><%= ViewData["Result"] %></pre>
		<br />
	</div>
	<div id="side">
		<h1>Instructions</h1>
		<p>The available objects are structured and created as follows:</p>
		<br />
		<div class="sample-code smaller-code">
			<p>
				public class User : Drop<br />
				{<br />
				&nbsp;&nbsp;public string Name { get; set; }<br />
				&nbsp;&nbsp;public List&lt;Task&gt; Tasks { get; set; }<br />
				}<br />
				<br />
				public class Task<br />
				{<br />
				&nbsp;&nbsp;public string Name { get; set; }<br />
				}<br />
				<br />
				user = new User<br />
				{<br />
				&nbsp;&nbsp;Name = "Tim Jones",<br />
				&nbsp;&nbsp;Tasks = new List&lt;Task&gt;<br />
				&nbsp;&nbsp;{<br />
				&nbsp;&nbsp;&nbsp;&nbsp;new Task { Name = "Documentation" },<br />
				&nbsp;&nbsp;&nbsp;&nbsp;new Task { Name = "Code comments" }<br />
				&nbsp;&nbsp;}<br />
				}<br />
			</p>
		</div>
		<br />
		<p>You can refer to the <a href="http://github.com/formosatek/dotliquid/wiki/DotLiquid-for-Designers">DotLiquid for Designers</a> wiki page
		to find out which tags and filters are available.</p>
		<h2>How does this work?</h2>
		<p>Why not have a look at the <a href="http://github.com/formosatek/dotliquid/tree/master/src/DotLiquid.Website/Controllers/TryOnlineController.cs">source code</a> of the page you're looking at now?</p>
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.observe_field.js"></script>

	<script type="text/javascript">
		function liquify(textarea) {
			var templateCode = $('<div/>').text(textarea.value).html();
			$.post('<%= Url.Action("Liquify") %>', { templateCode: templateCode }, function (data) {
				$(".result").html(data);
			});
		}

		$(function () {
			//$("#liquify").hide();

			$("#templateCode").observe_field(0.5, function () {
				liquify(this);
			});
		});
	</script>
</asp:Content>