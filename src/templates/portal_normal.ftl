<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<head>
	<title>${the_title} - ${company_name}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
	<!-- appPath Variable : to load components and module files -->
	<#assign appPath = "${theme_display.getPortalURL()}${theme_display.getPathThemeRoot()}/app"/>
	<!-- nodeModules Variable : to load dependant node module files -->
	<#assign nodeModules = "${theme_display.getPortalURL()}${theme_display.getPathThemeRoot()}/node_modules"/>
</head>
<body class="${css_class}">
<@liferay_ui["quick-access"] contentId="#main-content" />
<@liferay_util["include"] page=body_top_include />
<@liferay.control_menu />

<div class="container-fluid" id="wrapper">
	<header id="banner" role="banner">
		<div id="heading">
			<h1 class="site-title">
				<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" height="${site_logo_height}" src="${site_logo}" width="${site_logo_width}" />
				</a>
				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</h1>
		</div>
		<#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
		</#if>
		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>
	<section id="content">
		<!-- Load your Angular App -->
		<my-app>Loading...</my-app>
		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}
			${portletDisplay.setTitle(the_title)}
			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>
	<footer id="footer" role="contentinfo">
		<p class="powered-by">
			<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
		</p>
	</footer>
</div>
<@liferay_util["include"] page=body_bottom_include />
<@liferay_util["include"] page=bottom_include />
<!-- inject:js-->
<script>
	define._amd = define.amd;
	define.amd = false;
</script>
<!-- Load common libraries -->
<script src="${nodeModules}/core-js/client/shim.min.js"></script>
<script src="${nodeModules}/zone.js/dist/zone.js"></script>
<script src="${nodeModules}/rxjs/bundles/Rx.js"></script>
<!-- Load Angular Dependencies -->
<script src="${nodeModules}/@angular/core/bundles/core.umd.js"></script>
<script src="${nodeModules}/@angular/common/bundles/common.umd.js"></script>
<script src="${nodeModules}/@angular/compiler/bundles/compiler.umd.js"></script>
<script src="${nodeModules}/@angular/platform-browser/bundles/platform-browser.umd.js"></script>
<script src="${nodeModules}/@angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js"></script>
<!-- Load App 'modules' -->
<script src='${appPath}/app.component.js'></script>
<script src='${appPath}/app.module.js'></script>
<!-- Calling our Angular App to page -->
<script>
	(function(app) {
		document.addEventListener('DOMContentLoaded', function() {
			ng.platformBrowserDynamic
			.platformBrowserDynamic()
			.bootstrapModule(app.AppModule);
		});
	})(window.app || (window.app = {}));
</script>
<script>
	define.amd = define._amd;
</script>
<!-- endinject -->
</body>
</html>