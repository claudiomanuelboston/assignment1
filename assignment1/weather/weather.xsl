<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <!-- we define a template for the the whole branch of the xml document -->
    <xsl:template match="/">
      <html>
        <head>
	    <!-- we define the title of the document -->
          <title><xsl:value-of select="/current_observation/location"/></title>
        </head>
        <body>
		  <!-- applies a template to the current document -->
          <xsl:apply-templates />
        </body>
      </html>
    </xsl:template>
  
    <!-- we match the element "current_observation" and we select several values from the XML-->
	<xsl:template match="current_observation">
		<h1><xsl:value-of select="location"/></h1>
		<p><img src="{icon_url_base}{icon_url_name}" alt="weather icon"/><br/><xsl:value-of select="weather"/></p>
		<h1>Temperature: <xsl:value-of select="temp_f"/>&#xB0;F</h1>
		<h1>Wind: <xsl:value-of select="wind_string"/></h1>
		<h1>Humidity: <xsl:value-of select="relative_humidity"/></h1>
		<h1>Pressure: <xsl:value-of select="pressure_string"/></h1>
		<h1>Dew Point: <xsl:value-of select="dewpoint_string"/></h1>
		<h1>Visibility: <xsl:value-of select="visibility_mi"/></h1>
		<h1><xsl:value-of select="observation_time"/></h1>
		
		<!-- we define a link to recent observations for this city-->
		<p class="links">
			<a href="http://www.weather.gov/data/obhistory/{station_id}.html"><xsl:value-of select="station_name"/>Recent Observation History</a>
		</p>
		
		<!-- we define a link to the national weather service-->
		<p class="credit">
		  <br/>
		  <a href="http://weather.gov/">NOAA's National Weather Service</a>
		</p>
	</xsl:template>	
   
</xsl:stylesheet>