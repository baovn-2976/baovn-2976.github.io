<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
   <xsl:template match="/">
       <head> <br> <strong> Draw elip - Trinh Quoc Bao</strong> </br></head>
       <body>
           <xsl:apply-templates></xsl:apply-templates>
       </body>
   </xsl:template>
    
    
    <xsl:template match="root">
        <xsl:apply-templates>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:variable name="vi_tri"/>
    
    <xsl:variable name="vi_tri_1" select="'translate(0,50)'"/>
    <xsl:variable name="vi_tri_2" select="'translate(70,150)'"/>
    <xsl:variable name="vi_tri_3" select="'translate(-70,150)'"/>
    
    <xsl:template match="графика">
        <g>
            <svg height="640" width="480">
            <xsl:for-each select="эллипс">          
                <xsl:variable name="id" select="@id"/>
                <xsl:variable name="заливка" select="@заливка"/>
                <xsl:variable name="ободок" select="@ободок"/>
                <xsl:variable name="ширина-ободка" select="@ширина-ободка"/>
                <xsl:variable name="cx" select="@cx"/>
                <xsl:variable name="cy" select="@cy"/>
                <xsl:variable name="rx" select="@rx"/>
                <xsl:variable name="ry" select="@ry"/> 
                
                
                <xsl:for-each select="1 to 3">
                    <xsl:if test ="position()= 1">
                        <xsl:value-of select="$vi_tri = $vi_tri_1"/>
                    </xsl:if>
                    <xsl:if test="position()= last() - 1">
                        <xsl:value-of select="$vi_tri = $vi_tri_2"/>
                    </xsl:if>
                    <xsl:if test="position()= last()">
                        <xsl:value-of select="$vi_tri = $vi_tri_3"/>
                    </xsl:if>
                </xsl:for-each>
                
                    <ellipse cx = "{$cx}" cy ="{$cy}" rx ="{$rx}" ry="{$ry}" 
                        stroke="{$ободок}" stroke-width="{$ширина-ободка}" fill="{$заливка}" transform="{$vi_tri}" />
                
            </xsl:for-each>
            </svg>
        </g>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>