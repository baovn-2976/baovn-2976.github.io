<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:variable name="ball">3</xsl:variable>
    <xsl:template match ="/">
        <html>
            <head>
                <title><strong> author - Trinh Quoc Bao </strong></title>
            </head>
            <body style="background-color:gold">
                <xsl:for-each select="table/student">
                    <p>
                        <xsl:choose>
                                                   
                            <xsl:when test="mark &gt; $ball">
                                name:<span style ="background-color:red"><xsl:value-of select="name"/></span>
                                web-desigh: <strong><em style="color:blue"><xsl:value-of select="mark"/></em></strong> 
                            </xsl:when>
                            <xsl:otherwise>
                                name:<span style ="color:red"><xsl:value-of select="name"/></span>
                                web-desigh: <strong><em style="color:blue"><xsl:value-of select="mark"/></em></strong> 
                            </xsl:otherwise>
                        </xsl:choose>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>