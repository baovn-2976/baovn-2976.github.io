<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"    
    
    version="2.0">   
   
         <xsl:template match="/">
             
             <head> 
                 <br>
                     <strong> Math - Trinh Quoc Bao </strong>
                 </br>
				 <script src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'></script>
             </head>
             <body>  
                 <!-- phan mo dau -->
                 <mi>
                     <xsl:for-each select="root/строка">
                            <xsl:if test="position() = 1">                               
                                <xsl:value-of select="операнд"/>                                
                            </xsl:if>
                     </xsl:for-each>
                 </mi>   
                 <mo>   
                     <xsl:for-each select="root/строка">
                         <xsl:value-of select="оператор[1]"/>
                     </xsl:for-each>
                 </mo>   
                 <!-- end phan mo dau -->
                             
                 <math xmlns="http://www.w3.org/1998/Math/MathML">
                     <msqrt>
                         <!-- phan so -->
                         <mfrac linethickness="200%"> 
                             <mrow>
                                 <mi>
                                     <xsl:for-each select="//дробь/строка">
                                         <xsl:if test="position() = 1">
                                             <xsl:value-of select="число"/>
                                         </xsl:if>
                                     </xsl:for-each>
                                 </mi>
                             </mrow>                             
                             <mrow>
                                 <mi>
                                     <xsl:for-each select="//дробь/строка">
                                         <xsl:if test="position() = last()">
                                             <xsl:value-of select="операнд"/>
                                         </xsl:if>
                                     </xsl:for-each>
                                 </mi>
                             </mrow>                 
                          
                         </mfrac>
                         <!-- end phan so -->  
                        
                        <!-- Phan sum -->                        
                         <mrow>
                             <mstyle displaystyle="true">
                                 <munderover>
                                     <mo>&#8721;</mo>
                                     <mrow>                                         
                                         <mi>
                                             <xsl:for-each select="//низверх/строка">
                                                <xsl:if test="position() = 2 ">
                                                    <xsl:value-of select="операнд"/>
                                                </xsl:if>
                                             </xsl:for-each>
                                         </mi>
                                         <mo>
                                             <xsl:for-each select="//низверх/строка">
                                                <xsl:if test="position() = last()-1">
                                                    <xsl:value-of select="оператор"/>
                                                </xsl:if>
                                             </xsl:for-each>
                                         </mo>
                                         <mn>
                                             <xsl:for-each select="//низверх/строка">
                                                <xsl:if test="position() = last()-1">
                                                    <xsl:value-of select="число"/>
                                                </xsl:if>
                                             </xsl:for-each>
                                         </mn>                                   
                                         
                                     </mrow>
                                     <mi>
                                         <xsl:for-each select="//низверх/*">
                                             <xsl:if test="position() = last()">
                                                 <xsl:value-of select="операнд"/>
                                             </xsl:if>
                                         </xsl:for-each>
                                     </mi>
                                 </munderover>
                             </mstyle>
                         </mrow>
                        <!-- end sum -->
                         
                         <mrow>
                             <msup>
                                 <!-- phan trong ngoac -->
                                 <mi>
                                     <mo> 
                                         <xsl:for-each select="//верх/строка">
                                             <xsl:value-of select="оператор[1]"/>
                                         </xsl:for-each>
                                     </mo>
                                     
                                     <math xmlns="http://www.w3.org/1998/Math/MathML">
                                            <msub>
                                                <mi>
                                                    <xsl:for-each select="//низ/строка[1]">
                                                        <xsl:value-of select="операнд"/>
                                                    </xsl:for-each>
                                                </mi>
                                                <mrow>
                                                    <mn>
                                                        <xsl:for-each select="//низ/строка[last()]">
                                                            <xsl:value-of select="операнд"/>
                                                        </xsl:for-each>
                                                    </mn>
                                                    
                                                </mrow>
                                                
                                            </msub> 
                                     </math>
                                     <mo> 
                                         <xsl:for-each select="//верх/строка">
                                             <xsl:value-of select="оператор[2]"/>
                                         </xsl:for-each>
                                     </mo>
                                     <mo> 
                                         <xsl:for-each select="//верх/строка">
                                            <xsl:if test="position() = last() -1">
                                                <xsl:value-of select="операнд"/>
                                            </xsl:if>
                                        </xsl:for-each>
                                     </mo>
                                     <mo>
                                         <xsl:for-each select="//верх/строка">
                                             <xsl:value-of select="оператор[last()]"/>
                                         </xsl:for-each>
                                     </mo>
                                 </mi>
                                 <!-- end phan trong ngoac -->
                                 <mi>
                                     <xsl:for-each select="//верх/строка">
                                         <xsl:if test="position() = last()">
                                             <xsl:value-of select="число"/>
                                         </xsl:if>                                         
                                     </xsl:for-each>
                                 </mi>
                             </msup>
                             
                         </mrow>                        
                         
                     </msqrt>
                                
                 </math>
                 <mo>
                     <xsl:for-each select="root/строка">
                        
                             <xsl:value-of select="оператор[last()]"/>
                         
                     </xsl:for-each>
                 </mo>            
                
             </body>
             
            
         </xsl:template>
    
</xsl:stylesheet>