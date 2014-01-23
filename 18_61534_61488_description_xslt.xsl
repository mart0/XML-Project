<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet	version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:x="http://www.w3schools.com"
				exclude-result-prefixes="x">
	
	<xsl:param name="id">h1</xsl:param>
	
	
	
	<xsl:template match="x:medicines">
		<xsl:for-each select="x:medicine">
			<xsl:if test="@id=$id">
				
				<div id="name">
			
        		<xsl:value-of select="x:name" />
   			
    			</div>
    			<img src="images/{$id}.jpg"/>
		
				<div id="description"><xsl:value-of select="x:description"/></div>
				
			</xsl:if>
			
		</xsl:for-each>
	</xsl:template>	
	<!-- <xsl:template match="x:medicine[@id='h1']">
		<div id="name">
			
        		<xsl:value-of select="x:name" />
   			
    	</div>
    	<img src="http://www.apteki366.com/images/pictures/0281479917488416.jpg"/>
		
		<div id="description"><xsl:value-of select="x:description"/></div> -->
		<!-- <td>
			<xsl:value-of select="x:manifacturer/x:address" /><br />
			<xsl:value-of select="x:manifacturer/x:phone_number" />
		</td> -->
		<!-- Format the expiration date  -->
		<!-- <xsl:if test="x:expiration">
			<td>
				<xsl:value-of select="substring(x:expiration, 9, 2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(x:expiration, 6, 2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(x:expiration, 1, 4)"/>
			</td>
		</xsl:if>	 -->	
		<!-- <div id="price"><xsl:value-of select="x:price" /></div> -->

		<!-- <td><xsl:value-of select="x:stock" /></td> -->
	


	
	
	<!-- <xsl:template match="name">
  		<xsl:value-of select="'http://somesite.com'"/>
 	</xsl:template> -->

 	
	<!-- <xsl:template name="get_stock">
		<xsl:param name="hotel_id" />
		<xsl:param name="city_id" select="//x:regions/x:hotel_city[@hotel_id=$hotel_id]/@city_id" />
		<xsl:value-of select="//x:cities/x:city[@id=$city_id]" />
	</xsl:template> -->
	
	
	
	<!-- <xsl:template match="x:cities">
		<xsl:for-each select="x:city">
		<xsl:sort select="." order="{$sortOrder}" data-type="{$sortType}" />
			<xsl:call-template name="get_hotel">
				<xsl:with-param name="city_id" select="@id" />
				<xsl:with-param name="city_name" select="text()" />
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="get_hotel">
		<xsl:param name="city_id" />
		<xsl:param name="city_name" />
		<xsl:for-each select="//x:regions/x:hotel_city[@city_id=$city_id]/@hotel_id">
		<tr>
			<xsl:apply-templates select="//x:hotel[@id=current()]" />
			<td class="city"><xsl:value-of select="$city_name" /></td>
		</tr>
		</xsl:for-each>
	</xsl:template>
	
	
	<xsl:decimal-format name="currency" decimal-separator="." grouping-separator="," NaN="not available" /> -->
	
</xsl:stylesheet>
