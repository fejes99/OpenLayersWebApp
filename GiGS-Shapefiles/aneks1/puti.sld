<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" 
    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
    xmlns="http://www.opengis.net/sld" 
    xmlns:ogc="http://www.opengis.net/ogc" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <!-- a named layer is the basic building block of an sld document -->

  <NamedLayer>
    <Name>Putevi</Name>
    <UserStyle>
        <!-- they have names, titles and abstracts -->
      
      <Title>A boring default style</Title>
      <Abstract>A sample style that just prints out a green line</Abstract>
      <!-- FeatureTypeStyles describe how to render different features -->
      <!-- a feature type for lines -->

      <FeatureTypeStyle>
        <!--FeatureTypeName>Feature</FeatureTypeName-->
        
        <!--medjunarodni-->
        <Rule>
          <Name>medjunarodni</Name>
         <Title>Medjunarodni put</Title>
         <Abstract>A green line with a 2 pixel width</Abstract>
          <ogc:Filter>
    <ogc:PropertyIsLike wildCard="*" singleChar="?" escape="\">
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>*unarodni</ogc:Literal>
    </ogc:PropertyIsLike>
          </ogc:Filter>        
         <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FF0000</CssParameter>
              <CssParameter name="stroke-width">8</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FFFFCC</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        

<!--magistralni-->
        <Rule>
          <Name>magistralni</Name>
          <Title>Magistralni put</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>

          <ogc:Filter>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>magistralni</ogc:Literal>
      </ogc:PropertyIsEqualTo>
  </ogc:Filter>
          <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>3e6</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#EA6922</CssParameter>
              <CssParameter name="stroke-width">4</CssParameter>
            </Stroke>
          </LineSymbolizer>
          </Rule>
         

        <!--regionalni-->
        <Rule>
        <Name>regionalni</Name>
          <Title>Regionalni put</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>regionalni</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      </ogc:Filter>
          
      <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>1e6</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#EECB26</CssParameter>
              <CssParameter name="stroke-width">3</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
  
        
        <!--lokalni-->
        <Rule>
        <Name>lokalni_asfalt</Name>
          <Title>Lokalni - asfalt</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>
        <ogc:And>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>lokalni</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      <ogc:Or>
      <ogc:Or>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>asfalt</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>beton</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      </ogc:Or>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>penetracija</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      </ogc:Or>
  </ogc:And>
  </ogc:Filter>
   <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>6e5</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <!--lokalni makadam-->
        <Rule>
        <Name>lokalni_makadam</Name>
          <Title>Lokalni - makadam</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>
        <ogc:And>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>lokalni</ogc:Literal>
      </ogc:PropertyIsEqualTo>      
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>makadam</ogc:Literal>
      </ogc:PropertyIsEqualTo>            
  </ogc:And>
  </ogc:Filter>
          <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>600000</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke-dasharray">7 3</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <!--lokalni zemlja-->
        <Rule>
        <Name>lokalni_zemlja</Name>
          <Title>Lokalni - zemlja</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>
        <ogc:And>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>lokalni</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>zemlja</ogc:Literal>
      </ogc:PropertyIsEqualTo>
  </ogc:And>
  </ogc:Filter>
   <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>600000</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#BF561C</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke-dasharray">5 3</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
        <!--lokalni nepoznato-->
        <Rule>
        <Name>lokalni_nepoznato</Name>
          <Title>Lokalni - nepoznato</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>
        <ogc:And>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>lokalni</ogc:Literal>
      </ogc:PropertyIsEqualTo>
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>podloga1</ogc:PropertyName>
        <ogc:Literal>nepoznato</ogc:Literal>
      </ogc:PropertyIsEqualTo>
  </ogc:And>
  </ogc:Filter>
   <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>600000</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#000000</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>              
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
        <!--nepoznato-->
        <Rule>
        <Name>Nepoznato</Name>
          <Title>Nepoznato</Title>
          <Abstract>A green line with a 2 pixel width</Abstract>
        <ogc:Filter>

      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>znacaj1</ogc:PropertyName>
        <ogc:Literal>nepoznato</ogc:Literal>
      </ogc:PropertyIsEqualTo>

  </ogc:Filter>
   <MinScaleDenominator>0</MinScaleDenominator>
          <MaxScaleDenominator>600000</MaxScaleDenominator>
          <!-- like a polygonsymbolizer -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#000000</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>              
            </Stroke>
          </LineSymbolizer>
        </Rule>
        
        </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>

