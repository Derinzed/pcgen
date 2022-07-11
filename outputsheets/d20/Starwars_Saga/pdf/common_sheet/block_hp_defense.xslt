<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:str="http://xsltsl.sourceforge.net/string.html"
	xmlns:xalan="http://xml.apache.org/xalan"
	>

	<xsl:import href="../../../../xsltsl-1.1/stdlib.xsl"/>
	<xsl:import href="../inc_pagedimensions.xslt"/>


	<!--
====================================
====================================
	TEMPLATE - HP
====================================
====================================-->
	<xsl:template match="character" mode="hp_table">	
		<fo:table table-layout="fixed" width="100%">
			<xsl:choose>
				<xsl:when test="hit_points/usealternatedamage = 0">
					<fo:table-column column-width="12mm" />
					<!-- TITLE -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column column-width="8mm" />
					<!-- TOTAL HP -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.28 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- WOUNDS -->
					<fo:table-column column-width="2mm"/>
					<!-- space-->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.28 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SUBDUAL -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- DR -->
					<fo:table-column column-width="3mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.27 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SPEED -->
					<fo:table-body>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell>
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">WOUNDS/CURRENT HP</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">SUBDUAL DAMAGE</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">DAMAGE REDUCTION</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="6pt">SPEED</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">HP</fo:block>
								<fo:block line-height="4pt" font-size="4pt">hit points</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
									<xsl:value-of select="hit_points/points"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.current'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.subdual'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'damage.reduction'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="hit_points/damage_reduction"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'speed'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="basics/move/all"/>
									<xsl:value-of select="basics/move/move/maneuverability"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</xsl:when>
				<xsl:otherwise>	
					<fo:table-column column-width="12mm" />
					<!-- TITLE Vitality -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column column-width="8mm" />
					<!-- TOTAL Vitality -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- WOUNDS -->
					<fo:table-column column-width="2mm"/><!-- space-->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SUBDUAL -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.11 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- TITLE Wound points-->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- TOTAL Wound points -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- DR -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.27 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SPEED -->
					<fo:table-body>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell><fo:block/></fo:table-cell><!-- TITLE Vitality -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>	<!-- TOTAL Vitality -->
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">WOUNDS/CURRENT HP</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">SUBDUAL DAMAGE</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- TITLE Wound points -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>	<!-- TOTAL Wound points -->
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">DAMAGE REDUCTION</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="6pt">SPEED</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">VP</fo:block>
								<fo:block line-height="4pt" font-size="4pt">Vitality</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
									<xsl:value-of select="hit_points/points"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.current'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.subdual'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">WP</fo:block>
								<fo:block line-height="4pt" font-size="4pt">Wound Points</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
									<xsl:value-of select="hit_points/alternate"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'damage.reduction'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="hit_points/damage_reduction"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'speed'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="basics/move/all"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table>
		<!-- END HP Table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - AC TABLE
====================================
====================================-->
	<xsl:template match="armor_class">	

		<!-- END AC Table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - Initiative TABLE + Misc
====================================
====================================-->
	<xsl:template match="initiative">
		<!-- BEGIN ini-base table -->
		<fo:table table-layout="fixed" width="100%">		<!--space-before="2pt"-->
			<!-- 0.26 * $pagePrintableWidth - mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.49 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	1	-->
			<fo:table-column column-width="2mm"/>		<!--	2	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	3	-->
			<fo:table-column column-width="2mm"/>		<!--	4	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	5	-->
			<fo:table-column column-width="2mm"/>		<!--	6	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	7	-->
			<fo:table-column column-width="2mm"/>		<!--	8	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	9	-->
			<fo:table-column column-width="2mm"/>		<!--	10	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	11	-->




			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
						<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">INITIATIVE</fo:block>
						<fo:block line-height="4pt" font-size="4pt">modifier</fo:block>
					</fo:table-cell>		<!--	1	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	2	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="SW_initiativetotal"/>
						</fo:block>
					</fo:table-cell>		<!--	3	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">=</fo:block>
					</fo:table-cell>		<!--	4	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="dex_mod"/>
						</fo:block>
					</fo:table-cell>		<!--	5	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
					</fo:table-cell>		<!--	6	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="SW_misc_mod"/>
						</fo:block>
					</fo:table-cell>		<!--	7	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
					</fo:table-cell>		<!--	6	-->		<!--	8	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="SW_initiativefeatbonus"/>
						</fo:block>
					</fo:table-cell>		
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
					</fo:table-cell>		
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="SW_heroicboost"/>
						</fo:block>
					</fo:table-cell>		

				
				</fo:table-row>
<!--				<fo:table-row height="0.5pt"/>	-->
<!-- Label Row -->
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	1	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	2	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">TOTAL</fo:block>
					</fo:table-cell>		<!--	3	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	4	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">DEX MODIFIER</fo:block>
					</fo:table-cell>		<!--	5	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	6	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">PROFICIENCY</fo:block>
					</fo:table-cell>		<!--	7	-->
					<!-- New Stuff	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	8	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">FEATS</fo:block>
					</fo:table-cell>		<!--	9	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	10	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">LEVEL</fo:block>
					</fo:table-cell>		<!--	11	-->

					
					



				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END ini-base table -->
	</xsl:template>

	<!--		NOT USED
====================================
====================================
	TEMPLATE - Base Attack TABLE
====================================
====================================-->
	<xsl:template match="bab" mode="bab">
		<!-- BEGIN ini-base table -->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.44 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="2mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.56 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'bab.title'"/>
						</xsl:call-template>
						<fo:block line-height="10pt" font-weight="bold" font-size="7.5pt">BASE ATTACK</fo:block>
						<fo:block line-height="4pt" font-size="4pt">bonus</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'bab.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:call-template name="process.attack.string">
								<xsl:with-param name="bab" select="."/>
<xsl:with-param name="maxrepeat" select="4"/>
							</xsl:call-template>
<!-- What is this?-->							<!--xsl:value-of select="../../attack/melee/base_attack_bonus"/-->
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END ini-base table -->
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - encumbrance TABLE
====================================
====================================-->
	<xsl:template name="encumbrance">
		<!-- BEGIN encumbrance table -->
<!--	<xsl:if test="/character/equipment/total/load != 'Light'">	-->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="2mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="0pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
					<fo:block line-height="10pt" font-weight="bold" font-size="7pt" space-before="0pt">Encumbrance</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<xsl:if test="(/character/equipment/total/load = 'Medium' or /character/equipment/total/load = 'Heavy' or /character/equipment/total/load = 'Overload')">
						<fo:block font-size="10pt" font-weight="bold" color="red">
							<xsl:value-of select="/character/equipment/total/load"/>
							<fo:inline font-size="6" font-weight="italics"> (rules applied)</fo:inline>
						</fo:block>
						</xsl:if>
						<xsl:if test="/character/equipment/total/load = 'Light'">
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:value-of select="/character/equipment/total/load"/>
						</fo:block>
						</xsl:if>

					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
<!--	</xsl:if>	-->
		<!-- END encumberance table -->
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - Resistance TABLE
====================================
====================================-->
	<xsl:template name="resistances">
		<!-- BEGIN Resistance table -->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
					<fo:block line-height="10pt" font-weight="bold" font-size="7pt" space-before="1pt">Res</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="8pt">
							<xsl:value-of select="resistance"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
<!--	</xsl:if>	-->
		<!-- END Resistance table -->
	</xsl:template>

<!--
====================================
====================================
	TEMPLATE - SAVES TABLE
====================================
====================================-->
	<xsl:template match="saving_throws">
		<!-- BEGIN Saves table -->
		<fo:table table-layout="fixed" width="100%" space-before="2mm">
			<fo:table-column column-width="82mm"/>	<!-- Saves Row -->
			<fo:table-column column-width="2mm"/>	<!-- Spacer -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.55 * $pagePrintableWidth - 86" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:apply-templates select="." mode="saves"/>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

<!--	Square Box Conditional Save area that we no longer need	
					<fo:table-cell padding-start="1pt">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'border'"/>
						</xsl:call-template>
						<fo:block font-size="4pt">Resistance</fo:block>
						<xsl:for-each select="resistances">
							<fo:block font-size="4pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
						</xsl:for-each>
					</fo:table-cell>		-->
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END Saves table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - SAVES TABLE
====================================
====================================-->
	<xsl:template match="saving_throws" mode="saves">
		<!-- BEGIN Saves table -->
		<fo:table table-layout="fixed" width="100%">
			<fo:table-column column-width="23mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="7mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="7mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">SAVING THROWS</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">TOTAL</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">BASE SAVE</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">ABILITY</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">ARMOR</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>
					
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">ARMOR ABILITY</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">MISC</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">EPIC</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">TEMP</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:for-each select="saving_throw">
					<fo:table-row space-before="2pt">
											<xsl:message>Test</xsl:message>
						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'saves.title'"/>
							</xsl:call-template>
							<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">
								<xsl:value-of select="translate(name/long, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
							</fo:block>
							<fo:block line-height="4pt" font-size="4pt">(<xsl:value-of select="ability"/>)</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'saves'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:if test="name/long='reflex'">
									<xsl:value-of select="SW_reflextotal"/>
								</xsl:if>
								<xsl:if test="name/long='will'">
									<xsl:value-of select="SW_willtotal"/>								
								</xsl:if>
								<xsl:if test="name/long='fortitude'">
									<xsl:value-of select="SW_fortitudetotal"/>								
								</xsl:if>	
								<xsl:if test="(name/long!='reflex') and (name/long!='will') and (name/long!='fortitude')">
									<xsl:value-of select="SW_fortitudetotal"/>									
								</xsl:if>							
							</fo:block>
						</fo:table-cell>
						
						<fo:table-cell>
							<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">=</fo:block>
						</fo:table-cell>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="base"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="abil_mod"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="magic_mod"/></xsl:call-template>
						<xsl:if test="name/long='reflex'">
							<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="SW_reflexarmor"/></xsl:call-template>
						</xsl:if>
						<xsl:if test="name/long='fortitude'">
							<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="SW_fortitudearmor"/></xsl:call-template>
						</xsl:if>
						<xsl:if test="name/long='will'">
							<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="SW_willarmor"/></xsl:call-template>
						</xsl:if>
						<xsl:if test="(name/long!='reflex') and (name/long!='will') and (name/long!='fortitude')">
							<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="SW_fortitudearmor"/></xsl:call-template>
						</xsl:if>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="misc_mod"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="epic_mod"/></xsl:call-template>
						<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'border.temp'"/>
								</xsl:call-template>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="2pt">
											<xsl:message>Test END</xsl:message>
						<fo:table-cell>
						<fo:block>
						</fo:block>
						</fo:table-cell>

					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template name="saves.entry">
		<xsl:param name="value"/>
		<fo:table-cell>
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'saves'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="2pt" font-size="10pt">
				<xsl:value-of select="$value"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell>
			<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">+</fo:block>
		</fo:table-cell>
	</xsl:template>




</xsl:stylesheet>
