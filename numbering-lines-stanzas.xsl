<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    version="3.0">

  <xsl:output method="xml" indent="yes"/>

  <!-- Copy everything by default to preserve the TEI structure. -->
  <xsl:mode on-no-match="shallow-copy"/>

  <!-- Number each stanza (lg) within its poem (div2) and ensure @type is present. -->
  <xsl:template match="lg">
    <xsl:copy>
      <xsl:attribute name="n">
        <xsl:number level="single" count="lg" from="div2"/>
      </xsl:attribute>
      <xsl:attribute name="type">
        <xsl:value-of select="(@type, 'stanza')[1]"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*[name() != 'n' and name() != 'type'] | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Number each line (l) within its stanza (lg). -->
  <xsl:template match="l">
    <xsl:copy>
      <xsl:attribute name="n">
        <xsl:number level="single" count="l" from="lg"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*[name() != 'n'] | node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
