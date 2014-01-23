<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet	version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:x="http://www.w3schools.com"
				exclude-result-prefixes="x">
	
	<xsl:param name="sortKey">name</xsl:param>
	<xsl:param name="sortOrder">ascending</xsl:param>
	<xsl:param name="sortType">text</xsl:param>
	
	<xsl:template match="/">
		<table border="0" class="sortable">
			<xsl:call-template name="create_header" />
			<xsl:choose>
				<xsl:when test="$sortKey = 'name'">
					<xsl:apply-templates select="//x:medicines" />
				</xsl:when>
				<xsl:when test="$sortKey = 'category'">
					<xsl:apply-templates select="//x:medicines" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="//x:medicines" />
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template name="create_header">
	<tr>
		<th>
			<a href="javascript:sort('name')">Name</a>
			<xsl:call-template name="show_sorting">
				<xsl:with-param name="header" select="'name'" />
			</xsl:call-template>
		</th>
		<th>
			<a href="javascript:sort('category')">Category</a>
			<xsl:call-template name="show_sorting">
				<xsl:with-param name="header" select="'category'" />
			</xsl:call-template>
		</th>
		<th>Description</th>
		<th>Manifacturer</th>
		<th>
			<a href="javascript:sort('expiration')">Expiration Date</a>
			<xsl:call-template name="show_sorting">
				<xsl:with-param name="header" select="'expiration'" />
			</xsl:call-template>
		</th>
		<th>
			<a href="javascript:sort('price')">Price</a>
			<xsl:call-template name="show_sorting">
				<xsl:with-param name="header" select="'price'" />
			</xsl:call-template>
		</th>
		<th>
			<a href="javascript:sort('stock')">Stock</a>
			<xsl:call-template name="show_sorting">
				<xsl:with-param name="header" select="'stock'" />
			</xsl:call-template>
		</th>
	</tr>
	</xsl:template>
	
	<xsl:template name="show_sorting">
		<xsl:param name="header" />
		<xsl:if test="$sortKey = $header">
			<xsl:if test="$sortOrder = 'ascending'">&#x25B4;</xsl:if>
			<xsl:if test="$sortOrder = 'descending'">&#x25BE;</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="x:medicines">
		<xsl:for-each select="x:medicine">
		<xsl:sort select="*[name(.)=$sortKey]|@*[name(.)=$sortKey]|x:price/*[name(.)=$sortKey]" order="{$sortOrder}" data-type="{$sortType}" />
		<tr>
			<xsl:apply-templates select="." />
		</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="x:medicine">
		<td>
			<xsl:variable name="URL">
  				<xsl:value-of select="@url"/> 
			</xsl:variable>
			<xsl:variable name="request_id">
  				<xsl:value-of select="@id"/> 
			</xsl:variable>
			<a href="{$URL}?id={$request_id}">
        		<xsl:value-of select="x:name" />
   			</a>
    		<br />
    	</td>
		<td><xsl:value-of select="@category" /></td>
		<td><xsl:value-of select="substring(x:description,0,50)" />...</td>
		<td>
			<xsl:value-of select="x:manifacturer/x:name" /><br />
			<xsl:value-of select="x:manifacturer/x:address" /><br />
			<xsl:value-of select="x:manifacturer/x:phone_number" />
		</td>

		<!-- Format the expiration date  -->

		<xsl:if test="x:expiration">
			<td>
				<xsl:value-of select="substring(x:expiration, 9, 2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(x:expiration, 6, 2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(x:expiration, 1, 4)"/>
			</td>
		</xsl:if>		
		<td><xsl:value-of select="format-number(x:price, '$#,###.00')" /></td>
		<td><xsl:value-of select="x:stock" /></td>
		
	</xsl:template>
	
</xsl:stylesheet>
