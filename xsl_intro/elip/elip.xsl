<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
                <title>Document</title>
            </head>
            <body>
                <xsl:element name="svg">
                    <xsl:attribute name="height">
                        <xsl:value-of select="/root/графика/@высота" />
                    </xsl:attribute>
                    <xsl:attribute name="width">
                        <xsl:value-of select="/root/графика/@ширина" />
                    </xsl:attribute>
                    <xsl:for-each select="/root/графика/эллипс">
                        <xsl:element name="ellipse">
                            <xsl:attribute name="cx">
                                <xsl:value-of select="@cx" />
                            </xsl:attribute>
                            <xsl:attribute name="cy">
                                <xsl:value-of select="@cy" />
                            </xsl:attribute>
                            <xsl:attribute name="rx">
                                <xsl:value-of select="@rx" />
                            </xsl:attribute>
                            <xsl:attribute name="ry">
                                <xsl:value-of select="@ry" />
                            </xsl:attribute>
                            <xsl:attribute name="fill">
                                <xsl:value-of select="@заливка" />
                            </xsl:attribute>
                            <xsl:attribute name="stroke-width">
                                <xsl:value-of select="@ширина-ободка" />
                            </xsl:attribute>
                            <xsl:attribute name="stroke">
                                <xsl:value-of select="@ободок" />
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>