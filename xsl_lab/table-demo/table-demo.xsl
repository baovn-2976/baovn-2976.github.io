<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
  <xsl:template match="/">
        <html>
            <head>
                <title> <br> <strong>Table Student - Trinh Quoc Bao </strong> </br> </title>
                <style>
                    th {
                    vertical-align:top
                    }
                    #1 {
                    
                    text-align:right
                    }
                    #2{
                    
                    text-align:left
                    }
                </style>
            </head>  
             <body>
                 <table border="3"  style="border-collapse:collapse;">
                     <tr bgcolor="#9acd32" border="3">
                         <th style="width:200px"> <p id = "1" style="text-align:right"> (fields) Mark:  </p>
                             
                             <p id= "2" style="text-align:left"> (records) Student: </p> 
                         </th>
                         
                         <th style="width:110px">Multimedia</th>
                         <th style="width:110px">Web-Design</th>
                         <th style="width:110px">Graphic</th>
                         <th style="width:110px">Logic</th>
                     </tr>
                     <tr></tr>
                     <xsl:for-each select="student/table">
                         <tr>
                             <td><xsl:value-of select="Student"/></td>
                             <td style="background-color:gray"><xsl:value-of select="Multimedia"/></td> 
                             <td style="background-color:gray"><xsl:value-of select="Web-Design"/></td> 
                             <td style="background-color:gray"><xsl:value-of select="Graphic"/></td>
                             <td style="background-color:gray"><xsl:value-of select="Logic"/></td>
                         </tr>
                     </xsl:for-each>
                 </table> 
             </body>
            
        </html>
  </xsl:template>
</xsl:stylesheet>