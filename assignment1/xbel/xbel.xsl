<?xml version="1.0" encoding="utf-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	
	<!-- we are defining a parameter with values of True/False   -->
	<xsl:param name="description"><xsl:value-of select="'true'"/> </xsl:param>
		
	<!-- we define a template for the the whole branch of the xml document -->	
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/xbel/title/text()"/></title>
				<link rel="stylesheet" type="text/css" href= "xbel.css"/>
			</head>

			<!-- we are selecting the title -->	
			<body>
				<div class="one">
					<h1><xsl:value-of select="/xbel/title/text()"/></h1>
				</div>
				
				 <!-- applies a template to the current document -->
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<!-- we define a template to match on xbel -->	
	<xsl:template match="xbel">
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<!-- we define a template to match on folder -->	
	<xsl:template match="folder">
		<li>
			<div class ="two">
				<xsl:value-of select="title"/>
			</div>
			<ul>
				 <!-- applies a template to the current document -->
				<xsl:apply-templates/>
			</ul>
		</li>
	</xsl:template>
	
	<!-- we define a template to match on folder -->	
	<xsl:template match="bookmark">
		<li>
			<div class="three">
				<a><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
					<xsl:value-of select="title"/>
				</a>
			</div>
			<xsl:if test="$description = 'true' "><xsl:value-of select="desc"/>
			</xsl:if>
		</li>
	</xsl:template>

	<!-- we define a template to match on text() -->	
	<xsl:template match="text()"/>

</xsl:stylesheet>