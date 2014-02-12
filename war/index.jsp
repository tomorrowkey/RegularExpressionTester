<%@page pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head prefix="og: http://ogp.me/ns#">
<meta charset="UTF-8">
<meta property="og:title" content="Java Regex Tester" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<%@include file="./current_url.jsp" %>" />
<meta property="og:locale" content="en_US" />
<meta property="og:image" content="<%@include file="./current_url.jsp" %>/img/screencapture.png" />
<meta property="og:image:type" content="image/png">
<meta property="og:site_name" content="Java Regex Tester" />
<meta property="og:description" content="Testing your Regular Expression Pattern" />
<meta property="fb:app_id" content="1423354567909150" />
<title>Java regex tester</title>
<link href='http://fonts.googleapis.com/css?family=Gudea:400,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" />
<style type="text/css">
* {
	font-family: 'Gudea', sans-serif;
}
input[type='text'], textarea {
	padding: 10px;
	font-family: 'Gudea', sans-serif;
	font-size: 17px;
}
form {
	margin-bottom: 0px;
}
header {
	margin-top: 10px;
	margin-bottom: 10px;
}
.contents {
	width: 780px;
}
.page {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
}
label {
	font-weight: normal;
}
label.title {
	font-size: 1.2em;
	font-weight: bold;
}
footer {
	margin-top: 10px;
	text-align: center;
}
.block {
	margin-bottom: 1em;
}

.result_block {
	border-width: 2px;
	padding: 10px;
	background-color: #f0f0f0;
	font-size: 17px;
}

pre {
	border-width: 0px;
	background-color: transparent;
	margin-bottom: 0px;
}

.result {
	border-width: 0px;
}

.highlight {
	background-color: #ffbb33;
}

.toast {
	display: none;
	position: fixed;
	z-index: 99999;
	width: 100%;
	text-align: center;
	bottom: 10em;
	font-size: 1.5em;
}

.toast .message {
	display: inline-block;
	color: #fff;
	padding: 10px;
	border-radius: 2px;
	box-shadow: 2px 2px 2px #666;
	-webkit-box-shadow: 2px 2px 2px #666;
	font-size: .8em;
	background: #282324;
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #554434),
		color-stop(1, #282324) );
}

.loading {
	display: none;
}

pre.error {
	display : inline;
	font-family: 'Inconsolata', sans-serif;
	color: #f00;
}
</style>
</head>
<body lang="en">
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=1423354567909150";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>

	<div class="page">
		<header>
			<h1>
				<a href="./" style="text-decoration: none; color: #000">Java regex tester</a>
			</h1>
		</header>
		<div class="contents">
			<form id="test_form" action="javascript:void(0);">
				<div class="block">
					<label for="target_text" class="title">Target text</label>
					<textarea id="target_text" class="form-control" tabindex="1"></textarea>
				</div>
				<div class="block">
					<label for="match_pattern" class="title">Regex pattern</label>
					
					<div class="input-group">
						<input type="text" id="match_pattern" class="form-control" tabindex="2" />
						<span class="input-group-btn">
							<span class="btn btn-default" id="copy_match_pattern" data-clipboard-target="match_pattern">
								<i class="fa fa-files-o"></i>
							</span>
						</span>
					</div>
				</div>
				<div style="text-align:right;">
					<label>
						<input type="checkbox" id="multiline" checked /> Multi line
					</label>
				</div>
				<div class="block">
					<label for="replace_pattern" class="title">Replacement</label> 
					<div class="input-group">
						<input type="text" id="replace_pattern" class="form-control" tabindex="3" />
						<span class="input-group-btn">
							<span class="btn btn-default" id="copy_replace_pattern" data-clipboard-target="replace_pattern">
								<i class="fa fa-files-o"></i>
							</span>
						</span>
					</div>
				</div>
				<div class="block" style="text-align: right;">
					<input type="submit" value="Test" tabindex="4" class="btn btn-primary" />
				</div>
			</form>
			<div class="block">
				<label class="title">Matches</label>
				<div class="result_block">
					<img src="./img/loading.gif" class="loading" alt="loading" />
					<pre id="matches_result" class="result"></pre>
				</div>
			</div>
			<div class="block">
				<label class="title">Find</label>
				<div class="result_block">
					<img src="./img/loading.gif" class="loading" alt="loading" />
					<pre id="find_result" class="result"></pre>
				</div>
			</div>
			<div class="block">
				<label class="title">Replaced</label>
				<div class="result_block">
					<img src="./img/loading.gif" class="loading" alt="loading" />
					<pre id="replace_result" class="result"></pre>
				</div>
			</div>
		</div>
		<footer>
			<div>
				<div style="display: inline-block; vertical-align: top;">
					<div class="fb-like" data-href="<%@include file="./current_url.jsp" %>" data-layout="button_count" data-action="like" data-show-faces="true" data-share="false"></div>
				</div>
				<div style="display: inline-block; vertical-align: top;">
					<a href="https://twitter.com/share" class="twitter-share-button" data-url="<%@include file="./current_url.jsp" %>" data-text="Java regex tester" data-related="tomorrowkey" id="tweet_anchor" target="_blank">Tweet</a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
				</div>
			</div>
			<small>
				<a href="https://github.com/tomorrowkey/RegularExpressionTester" class="minilink">Source code</a> / 
				<a href="http://blog.tomorrowkey.jp">Blog</a>&nbsp;
				<a href="http://www.facebook.com/tomorrowkey" class="minilink">Facebook</a>&nbsp;
				<a href="http://twitter.com/tomorrowkey" class="minilink">Twitter</a>
			</small>
			<br />
			<small>'Java regex tester' Coptyright tomorrowkey All
				Rights Reserved.
			</small>
		</footer>
	</div>
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script type="text/javascript" src="./js/ZeroClipboard.min.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-28848016-1']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

	</script>
	<script type="text/javascript">
	var highlight_colors = [
		'#ffbb33' , '#ff4444' , '#33b5e5' , '#aa66cc' , '#99cc00'
	];

	String.prototype.escape = function() {
		var characters = this.split('');
		var escaped = '';
		for ( var i in characters) {
			if (characters[i] === '\\') {
				escaped += '\\\\';
			} else {
				escaped += characters[i];
			}
		}
		return escaped;
	}
	String.prototype.replaceNewLine = function() {
		return this.replace('\n', '<br ;>');
	}

	function toast(sMessage) {
		var container = $('<div />').addClass('toast');
		var message = $('<div />').addClass('message').text(sMessage)
				.appendTo(container);
		container.appendTo(document.body);
		container.delay(100).fadeIn("fast", function() {
			$(this).delay(2000).fadeOut("fast", function() {
				$(this).remove();
			});
		});
	}

	$(document).ready(
			function() {
				$('#test_form').submit(
						function() {
							$('.result').empty();
							$('.loading').show();
						
							var target_text = $('#target_text').val();
							var match_pattern = $('#match_pattern').val();
							var multiline = $('#multiline').prop('checked')
							var replace_pattern = $('#replace_pattern').val();
							var url = './regexTest';

							var param = {
								target_text : target_text,
								match_pattern : match_pattern,
								multiline: multiline,
								replace_pattern : replace_pattern
							};

							$.ajax({
								url : url , 
								data : param , 
								success : function(data){ 
									$('.loading').hide();

									$('#matches_result').text(data.matches);
									
									var match_result = $('#find_result').empty();
									var text = data.text;
									var groups = data.groups;

									var position = 0;
									for ( var i in data.groups) {
										var group = groups[i];
										match_result.append(text.substring(position, group.start).replaceNewLine());
										position = group.start;

										var highlight = $('<span />').css('background-color',highlight_colors[i % highlight_colors.length]);
										highlight.append(text.substring(position, group.end).replaceNewLine());
										match_result.append(highlight);
										position = group.end;
									}
									match_result.append(text.substring(position, text.length).replaceNewLine());

									$('#replace_result').text(data.replaced_text);
								} , 
								error : function(error){
									$('.loading').hide();
									if(error.status == 400){
										$('#matches_result').empty().append($('<pre>').addClass('error').text(error.responseText));
									}else{
										$('#matches_result').empty().append($('<pre>').addClass('error').text('unknown error'));
									}
									
								}
							});
						});

				new ZeroClipboard($('#copy_match_pattern'), {
					moviePath: "/js/ZeroClipboard.swf"
				}).on('load', function(client) {
					client.on('complete', function(client, args) {
						toast('Copied');
					});
				});
				
				new ZeroClipboard($('#copy_replace_pattern'), {
					moviePath: "/js/ZeroClipboard.swf"
				}).on('load', function(client) {
					client.on('complete', function(client, args) {
						toast('Copied');
					});
				});

			});
	</script>
</body>
</html>