shinyUI(
  
  page_fluid(
    
    theme = psrc_theme_light,
    
    tags$head(
      tags$script(HTML("
      function resizeMapAreas(imgId, originalWidth) {
        const img = document.getElementById(imgId);
        const map = document.querySelector(`img#${imgId}`).useMap;
        const areas = document.querySelectorAll(`map[name='${map.substring(1)}'] area`);

        function resize() {
          const scale = img.clientWidth / originalWidth;

          areas.forEach(area => {
            const originalCoords = area.dataset.originalCoords.split(',').map(Number);
            const scaledCoords = originalCoords.map(coord => Math.round(coord * scale));
            area.coords = scaledCoords.join(',');
          });
        }

        areas.forEach(area => {
          if (!area.dataset.originalCoords) {
            area.dataset.originalCoords = area.coords;
          }
        });

        window.addEventListener('resize', resize);
        img.addEventListener('load', resize);
        resize();
      }

      document.addEventListener('DOMContentLoaded', function() {
        resizeMapAreas('planImage', 600);
      });
    "))
    ),
    
    layout_columns(
      col_widths = c(6, 5, 1),
    
      div(
        style = "text-align: left;",
        tags$img(
          src = "rtp-logo.png",
          height = "90px",
          alt = "Regional Transportation Plan Logo"
        )
      ),
      
      div(
        style = "text-align: right;",
        tags$img(
          src = "psrc-logo.png",
          height = "90px",
          alt = "PSRC's Logo"
        )
      ),
      
      div(
        style = "text-align: right;",
        checkboxInput("dark_mode", "🌙 Dark mode", value = FALSE, width = "100%")
      )
      
    ), # end of top page header column layout for images/logos/theme selection
    
    div(
      class = "mb-4",
      card_body(
        htmlOutput("overview_what_text"), 
        class = "selection_panel")
    ),

    card(
      layout_columns(
        
        col_widths = c(6,6),
        
        card_body(
          div(
            class = "text-center",
            tags$img(
              src = "plan-document-fidget-spinner-600px.png",
              usemap = "#rtpmap",
              id = "planImage",
              class = "img-fluid",
              style = "max-width: 600px; width: 100%; height: auto;"
            )
          ),
        ),
        
        card_body(div(style = "display:inline;", br(), br(), htmlOutput("overview_why_text"))),
        
      ), # end of layout_columns
      
    ), # end of card
    
    tags$map(name = "rtpmap",
             
             # Top Circle
             tags$area(
               shape = "circle", 
               coords = "300, 54, 40", 
               href = "https://experience.arcgis.com/experience/a6adb09dadfe4dc6b61394fac30ec3a6", 
               target = "_blank", 
               alt = "Link to the Transportation Visualization Tool", 
               title = "Visualization Tool"),
             
             # Top Right
             tags$area(
               shape = "circle", 
               coords = "479, 123, 40", 
               href = "https://www.psrc.org/node/278", 
               target = "_blank", 
               alt = "Link to the Access to Transit work program",
               title = "Access to Transit"),
             
             # Right
             tags$area(
               shape = "circle", 
               coords = "546, 302, 40", 
               href = "https://www.psrc.org/media/7655", 
               target = "_blank", 
               alt = "Link to the Active Transportation Plan",
               title = "Active Transportation Plan"),
             
             # Bottom Right
             tags$area(
               shape = "circle", 
               coords = "481, 479, 40", 
               href = "https://www.psrc.org/media/5944", 
               target = "_blank", 
               alt = "Link to the Financial Strategy",
               title = "Financial Strategy"),
             
             # Bottom
             tags$area(
               shape = "circle", 
               coords = "300, 551, 40", 
               href = "https://www.psrc.org/media/5941", 
               target = "_blank", 
               alt = "Link to the Air Quality Conformity analysis",
               title = "Air Quality Conformity analysis"),
             
             # Bottom Left
             tags$area(
               shape = "circle", 
               coords = "129, 488, 40", 
               href = "https://www.psrc.org/media/5942", 
               target = "_blank", 
               alt = "Link to the Alternatives Data & Performance Analysis",
               title = "Alternatives Data & Performance Analysis"),
             
             # Left
             tags$area(
               shape = "circle", 
               coords = "54, 300, 40", 
               href = "https://www.psrc.org/media/6395", 
               target = "_blank", 
               alt = "Link to the Coordinated Mobility Plan",
               title = "Coordinated Mobility Plan"),
             
             # Top Left
             tags$area(
               shape = "circle", 
               coords = "121, 127, 40", 
               href = "https://www.psrc.org/media/5943", 
               target = "_blank", 
               alt = "Link to the Federal Performance Targets",
               title = "Federal Performance Targets & the CMP"),
             
             # Upper Right Inner Quarter Circle
             tags$area(
               shape = "poly", 
               coords = "305,182,306,147,338,150,371,166,395,178,414,195,431,222,441,236,448,257,451,274,455,293,418,293,411,268,404,243,390,222,368,205,342,192",
               href = "https://www.psrc.org/media/9263", 
               target = "_blank", 
               alt = "Link to the Adopted Scope of Work",
               title = "Adopted Scope of Work"),
             
             # Lower Right Inner Quarter Circle
             tags$area(
               shape = "poly", 
               coords = "419,307,455,304,455,329,448,354,441,373,427,395,417,407,402,419,387,431,369,439,349,448,332,455,315,456,306,455,305,421,331,416,346,409,370,400,386,383,401,365,411,343,416,329", 
               href = "https://www.psrc.org/media/9680", 
               target = "_blank", 
               alt = "Link to the Current Transportation System Report",
               title = "Current Transportation System Report"),
             
             # Upper Left Inner Quarter Circle
             tags$area(
               shape="poly", 
               coords="146,295,183,295,187,273,195,253,203,239,212,225,229,211,240,200,258,192,273,187,294,184,295,146,281,145,262,149,245,155,227,163,212,173,195,185,179,203,164,226,152,250,147,269,145,283", 
               href = "https://www.psrc.org/media/9265", 
               target = "_blank", 
               alt = "Link to the Regional Safety Action Plan",
               title = "Regional Safety Action Plan"),
             
             # Lower Left Inner Quarter Circle
             tags$area(
               shape="poly", 
               coords="297,417,295,454,267,452,241,445,221,436,205,420,191,410,177,394,165,376,155,354,151,333,145,312,145,305,181,304,187,319,193,347,203,366,217,384,237,400,257,409,280,417", 
               href = "https://www.psrc.org/media/5939", 
               target = "_blank", 
               alt = "Link to the Public Outreach & Engagement",
               title = "Public Outreach & Engagement"),
             
             # Center of Image Circle
             tags$area(
               shape = "circle", 
               coords = "301,303,100", href = "https://www.psrc.org/media/5934", target = "_blank", alt = "Regional Transportation Plan", title = "Regional Transportation Plan")
             ),
    
    div(
      class = "mb-4",
      card_body(
        h3("A Transportation Plan for the Future"), 
        htmlOutput("rtp_insights_text"), 
        class = "insights_panel")
    ),
    
    # Card for Footer
    card(
      
      layout_columns(
        col_widths = c(2,7,3),
        
        card_body(tags$img(src='footer-logo.png', style="margin-top: 0x; padding-left: 0px; padding-right: 0px;", class = "responsive-image", alt = "PSRC logo"), class = "footer_panel"),
        
        card_body(
          tags$div(class = "footer_heading", HTML(paste0("About PSRC<br>", tags$div(class = "footer_about", psrc_mission)))),
        ),
        
        card_body(
          tags$div(class = "footer_heading", HTML(
            paste0(
              "Connect with PSRC<br>", 
              tags$div(
                class = "psrc-location", 
                style = "display: flex; align-items: top;",
                icon("location-dot", class = "m-connect-loc"), 
                div(
                  div("1201 Third Avenue, Suite 500"), 
                  "Seattle, WA 98101-3055")
              ),
              tags$div(class = "psrc-phone", 
                       style = "display: flex; align-items: center;", 
                       icon("phone-volume", class = "m-connect"), 
                       "206-464-7090"
              ),
              tags$a(class = "psrc_email",
                     icon("envelope", class = "m-connect"), 
                     href = paste0("mailto:","info@psrc.org","?"), 
                     "info@psrc.org")
            ))),
        ),
      ),
      
      card_footer(
        layout_columns(
          col_widths = c(9,3),
          card_body(div(
            a(class = "footer_url", 
              href="https://www.facebook.com/PugetSoundRegionalCouncil", 
              icon("facebook", class = "soc-connect"),
              span("Link to PSRC's Facebook page", class = "sr-only"), 
              target="_blank"),
            a(class = "footer_url", 
              href="https://twitter.com/SoundRegion", 
              icon("x-twitter", class = "soc-connect"),
              span("Link to PSRC's Twitter feed", class = "sr-only"),
              target="_blank"),
            a(class = "footer_url", 
              href="https://www.instagram.com/soundregion/", 
              icon("instagram", class = "soc-connect"), 
              span("Link to PSRC's Instagram feed", class = "sr-only"),
              target="_blank"),
            a(class = "footer_url", 
              href="https://www.linkedin.com/company/soundregion", 
              icon("linkedin", class = "soc-connect"), 
              span("Link to PSRC's LinkedIn feed", class = "sr-only"),
              target="_blank")
          )),
          
          tags$div(class = "footer_about", "Dashboard by", tags$div(class = "footer_url", "PSRC Data Science")),
        ),
        class = "footer_footer"),
      class = "footer_panel") # end of card for footer
    
    ) # end of page fluid
  
  ) #end of shiny UI