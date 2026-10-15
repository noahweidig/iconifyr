# Icon gallery

Iconify hosts 240+ icon sets behind one API. Every icon below was
fetched live with
[`iconify_html()`](https://noahweidig.github.io/iconifyr/reference/iconify_html.md).
Hover over an icon to see its id; pass it to
[`iconify_get()`](https://noahweidig.github.io/iconifyr/reference/iconify_get.md)
to get the SVG.

## Same idea, different sets

Seven sets, each with its own drawing style and license. Monotone icons
take the surrounding text color, so they follow light and dark themes.

``` r

gallery(list(
  mdi = c("home", "rocket-launch", "chart-line", "github"),
  tabler = c("brand-github", "map-pin", "leaf", "bolt"),
  lucide = c("camera", "sun", "leaf", "map"),
  ph = c("airplane", "tree", "map-pin", "chart-bar"),
  bi = c("globe", "tree", "bicycle", "graph-up"),
  carbon = c("earth", "chart-line", "map", "tree"),
  `fa6-solid` = c("tree", "earth-americas", "chart-simple", "bicycle")
))
```

[TABLE]

## Brand logos

``` r

gallery(list(
  `fa6-brands` = c("r-project", "github", "python", "docker"),
  `simple-icons` = c("rstudioide", "quarto", "github", "posit"),
  logos = c("r-lang", "github-icon", "python", "docker-icon")
))
```

[TABLE]

## Multicolor sets

`color` only recolors monotone icons. Emoji and flat-color sets keep
their own palette.

``` r

gallery(list(
  twemoji = c("globe-showing-americas", "seedling", "bar-chart", "rocket"),
  `flat-color-icons` = c("globe", "combo-chart", "camera")
))
```

[TABLE]

## Color, size, flip and rotate

One icon, many variations:

``` r

id <- "mdi:rocket-launch"
tags$div(
  icon_cell(id, color = "#e63946"),
  icon_cell(id, color = "#2a9d8f"),
  icon_cell(id, color = "#457b9d", size = 64),
  icon_cell(id, color = "#f4a261", flip = "horizontal"),
  icon_cell(id, color = "#8d5fd3", rotate = 90),
  icon_cell(id, color = "#264653", rotate = 180, flip = "vertical")
)
#> Waiting 300s for retry backoff ■                               
#> Waiting 300s for retry backoff ■                               
#> Waiting 300s for retry backoff ■■                              
#> Waiting 300s for retry backoff ■■                              
#> Waiting 300s for retry backoff ■■                              
#> Waiting 300s for retry backoff ■■                              
#> Waiting 300s for retry backoff ■■■                             
#> Waiting 300s for retry backoff ■■■                             
#> Waiting 300s for retry backoff ■■■                             
#> Waiting 300s for retry backoff ■■■■                            
#> Waiting 300s for retry backoff ■■■■                            
#> Waiting 300s for retry backoff ■■■■                            
#> Waiting 300s for retry backoff ■■■■■                           
#> Waiting 300s for retry backoff ■■■■■                           
#> Waiting 300s for retry backoff ■■■■■                           
#> Waiting 300s for retry backoff ■■■■■                           
#> Waiting 300s for retry backoff ■■■■■■                          
#> Waiting 300s for retry backoff ■■■■■■                          
#> Waiting 300s for retry backoff ■■■■■■                          
#> Waiting 300s for retry backoff ■■■■■■■                         
#> Waiting 300s for retry backoff ■■■■■■■                         
#> Waiting 300s for retry backoff ■■■■■■■                         
#> Waiting 300s for retry backoff ■■■■■■■■                        
#> Waiting 300s for retry backoff ■■■■■■■■                        
#> Waiting 300s for retry backoff ■■■■■■■■                        
#> Waiting 300s for retry backoff ■■■■■■■■                        
#> Waiting 300s for retry backoff ■■■■■■■■■                       
#> Waiting 300s for retry backoff ■■■■■■■■■                       
#> Waiting 300s for retry backoff ■■■■■■■■■                       
#> Waiting 300s for retry backoff ■■■■■■■■■■                      
#> Waiting 300s for retry backoff ■■■■■■■■■■                      
#> Waiting 300s for retry backoff ■■■■■■■■■■                      
#> Waiting 300s for retry backoff ■■■■■■■■■■■                     
#> Waiting 300s for retry backoff ■■■■■■■■■■■                     
#> Waiting 300s for retry backoff ■■■■■■■■■■■                     
#> Waiting 300s for retry backoff ■■■■■■■■■■■                     
#> Waiting 300s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■                    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■                   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■                   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■                   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■                  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■                  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■                  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■                  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■                 
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■                 
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■                 
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■                
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■                
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■                
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■               
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■               
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■               
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■               
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■              
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■              
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■              
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■             
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■             
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■             
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■            
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■           
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■          
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■          
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■          
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■         
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■         
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■         
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■         
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■        
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■        
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■        
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■       
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■       
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■       
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■      
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■      
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■      
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■      
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■     
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■     
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■     
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■    
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■   
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
#> Waiting 300s for retry backoff ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
```

![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjZTYzOTQ2IiBkPSJtMTMuMTYgMjIuMTlsLTEuNjYtMy44NGMxLjYtLjU4IDMuMDctMS4zNSA0LjQzLTIuMjdsLTIuNzggNi4xMW0tNy41LTkuNjlsLTMuODQtMS42NWw2LjExLTIuNzhhMjAgMjAgMCAwIDAtMi4yNyA0LjQzTTIxLjY2IDIuMzVTMjMuNzggNy4zMSAxOC4xMSAxM2MtMi4yIDIuMTctNC41OCAzLjUtNi43MyA0LjM0Yy0uNzQuMjgtMS41Ny4xLTIuMTItLjQ2bC0yLjEzLTIuMTNjLS41Ni0uNTYtLjc0LTEuMzgtLjQ3LTIuMTNDNy41IDEwLjUgOC44MyA4LjA5IDExIDUuODlDMTYuNjkuMjE2IDIxLjY2IDIuMzUgMjEuNjYgMi4zNU02LjI1IDIySDQuODRsNC4wOS00LjFjLjMuMjEuNjMuMzYuOTcuNDV6TTIgMjJ2LTEuNDFsNC43Ny00Ljc4bDEuNDMgMS40MkwzLjQxIDIyem0wLTIuODR2LTEuNDFsMy42NS0zLjY1Yy4wOS4zNS4yNC42OC40NS45N3pNMTYgNmEyIDIgMCAxIDAgMCA0YzEuMTEgMCAyLS44OSAyLTJhMiAyIDAgMCAwLTItMiIgLz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjMmE5ZDhmIiBkPSJtMTMuMTYgMjIuMTlsLTEuNjYtMy44NGMxLjYtLjU4IDMuMDctMS4zNSA0LjQzLTIuMjdsLTIuNzggNi4xMW0tNy41LTkuNjlsLTMuODQtMS42NWw2LjExLTIuNzhhMjAgMjAgMCAwIDAtMi4yNyA0LjQzTTIxLjY2IDIuMzVTMjMuNzggNy4zMSAxOC4xMSAxM2MtMi4yIDIuMTctNC41OCAzLjUtNi43MyA0LjM0Yy0uNzQuMjgtMS41Ny4xLTIuMTItLjQ2bC0yLjEzLTIuMTNjLS41Ni0uNTYtLjc0LTEuMzgtLjQ3LTIuMTNDNy41IDEwLjUgOC44MyA4LjA5IDExIDUuODlDMTYuNjkuMjE2IDIxLjY2IDIuMzUgMjEuNjYgMi4zNU02LjI1IDIySDQuODRsNC4wOS00LjFjLjMuMjEuNjMuMzYuOTcuNDV6TTIgMjJ2LTEuNDFsNC43Ny00Ljc4bDEuNDMgMS40MkwzLjQxIDIyem0wLTIuODR2LTEuNDFsMy42NS0zLjY1Yy4wOS4zNS4yNC42OC40NS45N3pNMTYgNmEyIDIgMCAxIDAgMCA0YzEuMTEgMCAyLS44OSAyLTJhMiAyIDAgMCAwLTItMiIgLz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSIjNDU3YjlkIiBkPSJtMTMuMTYgMjIuMTlsLTEuNjYtMy44NGMxLjYtLjU4IDMuMDctMS4zNSA0LjQzLTIuMjdsLTIuNzggNi4xMW0tNy41LTkuNjlsLTMuODQtMS42NWw2LjExLTIuNzhhMjAgMjAgMCAwIDAtMi4yNyA0LjQzTTIxLjY2IDIuMzVTMjMuNzggNy4zMSAxOC4xMSAxM2MtMi4yIDIuMTctNC41OCAzLjUtNi43MyA0LjM0Yy0uNzQuMjgtMS41Ny4xLTIuMTItLjQ2bC0yLjEzLTIuMTNjLS41Ni0uNTYtLjc0LTEuMzgtLjQ3LTIuMTNDNy41IDEwLjUgOC44MyA4LjA5IDExIDUuODlDMTYuNjkuMjE2IDIxLjY2IDIuMzUgMjEuNjYgMi4zNU02LjI1IDIySDQuODRsNC4wOS00LjFjLjMuMjEuNjMuMzYuOTcuNDV6TTIgMjJ2LTEuNDFsNC43Ny00Ljc4bDEuNDMgMS40MkwzLjQxIDIyem0wLTIuODR2LTEuNDFsMy42NS0zLjY1Yy4wOS4zNS4yNC42OC40NS45N3pNMTYgNmEyIDIgMCAxIDAgMCA0YzEuMTEgMCAyLS44OSAyLTJhMiAyIDAgMCAwLTItMiIgLz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld2JveD0iMCAwIDI0IDI0Ij48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNCAwKSBzY2FsZSgtMSAxKSI+PHBhdGggZmlsbD0iI2Y0YTI2MSIgZD0ibTEzLjE2IDIyLjE5bC0xLjY2LTMuODRjMS42LS41OCAzLjA3LTEuMzUgNC40My0yLjI3bC0yLjc4IDYuMTFtLTcuNS05LjY5bC0zLjg0LTEuNjVsNi4xMS0yLjc4YTIwIDIwIDAgMCAwLTIuMjcgNC40M00yMS42NiAyLjM1UzIzLjc4IDcuMzEgMTguMTEgMTNjLTIuMiAyLjE3LTQuNTggMy41LTYuNzMgNC4zNGMtLjc0LjI4LTEuNTcuMS0yLjEyLS40NmwtMi4xMy0yLjEzYy0uNTYtLjU2LS43NC0xLjM4LS40Ny0yLjEzQzcuNSAxMC41IDguODMgOC4wOSAxMSA1Ljg5QzE2LjY5LjIxNiAyMS42NiAyLjM1IDIxLjY2IDIuMzVNNi4yNSAyMkg0Ljg0bDQuMDktNC4xYy4zLjIxLjYzLjM2Ljk3LjQ1ek0yIDIydi0xLjQxbDQuNzctNC43OGwxLjQzIDEuNDJMMy40MSAyMnptMC0yLjg0di0xLjQxbDMuNjUtMy42NWMuMDkuMzUuMjQuNjguNDUuOTd6TTE2IDZhMiAyIDAgMSAwIDAgNGMxLjExIDAgMi0uODkgMi0yYTIgMiAwIDAgMC0yLTIiIC8+PC9nPjwvc3ZnPg==)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld2JveD0iMCAwIDI0IDI0Ij48ZyB0cmFuc2Zvcm09InJvdGF0ZSg5MCAxMiAxMikiPjxwYXRoIGZpbGw9IiM4ZDVmZDMiIGQ9Im0xMy4xNiAyMi4xOWwtMS42Ni0zLjg0YzEuNi0uNTggMy4wNy0xLjM1IDQuNDMtMi4yN2wtMi43OCA2LjExbS03LjUtOS42OWwtMy44NC0xLjY1bDYuMTEtMi43OGEyMCAyMCAwIDAgMC0yLjI3IDQuNDNNMjEuNjYgMi4zNVMyMy43OCA3LjMxIDE4LjExIDEzYy0yLjIgMi4xNy00LjU4IDMuNS02LjczIDQuMzRjLS43NC4yOC0xLjU3LjEtMi4xMi0uNDZsLTIuMTMtMi4xM2MtLjU2LS41Ni0uNzQtMS4zOC0uNDctMi4xM0M3LjUgMTAuNSA4LjgzIDguMDkgMTEgNS44OUMxNi42OS4yMTYgMjEuNjYgMi4zNSAyMS42NiAyLjM1TTYuMjUgMjJINC44NGw0LjA5LTQuMWMuMy4yMS42My4zNi45Ny40NXpNMiAyMnYtMS40MWw0Ljc3LTQuNzhsMS40MyAxLjQyTDMuNDEgMjJ6bTAtMi44NHYtMS40MWwzLjY1LTMuNjVjLjA5LjM1LjI0LjY4LjQ1Ljk3ek0xNiA2YTIgMiAwIDEgMCAwIDRjMS4xMSAwIDItLjg5IDItMmEyIDIgMCAwIDAtMi0yIiAvPjwvZz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld2JveD0iMCAwIDI0IDI0Ij48ZyB0cmFuc2Zvcm09InJvdGF0ZSgxODAgMTIgMTIpIHRyYW5zbGF0ZSgwIDI0KSBzY2FsZSgxIC0xKSI+PHBhdGggZmlsbD0iIzI2NDY1MyIgZD0ibTEzLjE2IDIyLjE5bC0xLjY2LTMuODRjMS42LS41OCAzLjA3LTEuMzUgNC40My0yLjI3bC0yLjc4IDYuMTFtLTcuNS05LjY5bC0zLjg0LTEuNjVsNi4xMS0yLjc4YTIwIDIwIDAgMCAwLTIuMjcgNC40M00yMS42NiAyLjM1UzIzLjc4IDcuMzEgMTguMTEgMTNjLTIuMiAyLjE3LTQuNTggMy41LTYuNzMgNC4zNGMtLjc0LjI4LTEuNTcuMS0yLjEyLS40NmwtMi4xMy0yLjEzYy0uNTYtLjU2LS43NC0xLjM4LS40Ny0yLjEzQzcuNSAxMC41IDguODMgOC4wOSAxMSA1Ljg5QzE2LjY5LjIxNiAyMS42NiAyLjM1IDIxLjY2IDIuMzVNNi4yNSAyMkg0Ljg0bDQuMDktNC4xYy4zLjIxLjYzLjM2Ljk3LjQ1ek0yIDIydi0xLjQxbDQuNzctNC43OGwxLjQzIDEuNDJMMy40MSAyMnptMC0yLjg0di0xLjQxbDMuNjUtMy42NWMuMDkuMzUuMjQuNjguNDUuOTd6TTE2IDZhMiAyIDAgMSAwIDAgNGMxLjExIDAgMi0uODkgMi0yYTIgMiAwIDAgMC0yLTIiIC8+PC9nPjwvc3ZnPg==)

``` r

iconify_html("mdi:rocket-launch", color = "#f4a261", flip = "horizontal")
iconify_html("mdi:rocket-launch", color = "#8d5fd3", rotate = 90)
```

## Pick an icon from search results

``` r

hits <- iconify_search("rocket", prefixes = c("mdi", "tabler", "ph", "lucide"), limit = 32)
head(hits, 8)
#>                   id prefix           name
#> 1         mdi:rocket    mdi         rocket
#> 2 mdi:rocket-outline    mdi rocket-outline
#> 3      tabler:rocket tabler         rocket
#> 4      lucide:rocket lucide         rocket
#> 5          ph:rocket     ph         rocket
#> 6     ph:rocket-bold     ph    rocket-bold
#> 7  ph:rocket-duotone     ph rocket-duotone
#> 8     ph:rocket-fill     ph    rocket-fill

tags$div(lapply(head(hits$id, 8), icon_cell, size = 36))
```

![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSJjdXJyZW50Q29sb3IiIGQ9Im0yMCAyMmwtMy44Ni0xLjU1Yy43LTEuNTMgMS4yLTMuMTEgMS41MS00Ljcyek03Ljg2IDIwLjQ1TDQgMjJsMi4zNS02LjI3Yy4zMSAxLjYxLjgxIDMuMTkgMS41MSA0LjcyTTEyIDJzNSAyIDUgMTBjMCAzLjEtLjc1IDUuNzUtMS42NyA3LjgzQTIgMiAwIDAgMSAxMy41IDIxaC0zYTIgMiAwIDAgMS0xLjgzLTEuMTdDNy43NiAxNy43NSA3IDE1LjEgNyAxMmMwLTggNS0xMCA1LTEwbTAgMTBjMS4xIDAgMi0uOSAyLTJzLS45LTItMi0ycy0yIC45LTIgMnMuOSAyIDIgMiIgLz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI0IDI0Ij48cGF0aCBmaWxsPSJjdXJyZW50Q29sb3IiIGQ9Ik0xMiAyUzcgNCA3IDEyYzAgMy4xLjc2IDUuNzUgMS42NyA3LjgzQTIgMiAwIDAgMCAxMC41IDIxaDNhMiAyIDAgMCAwIDEuODMtMS4xN0MxNi4yNSAxNy43NSAxNyAxNS4xIDE3IDEyYzAtOC01LTEwLTUtMTBtMS41IDE3aC0zYy0xLTIuMjQtMS41LTQuNTktMS41LTdjMC00LjY0IDEuOS02LjggMy03LjY3YzEuMS44NyAzIDMuMDMgMyA3LjY3YzAgMi40MS0uNSA0Ljc2LTEuNSA3bTYuNSAzbC0zLjg2LTEuNTVjLjctMS41MyAxLjItMy4xMSAxLjUxLTQuNzJtLTkuNzkgNC43Mkw0IDIybDIuMzUtNi4yN2MuMzEgMS42MS44MSAzLjE5IDEuNTEgNC43Mk0xMiAxMmMtMS4xIDAtMi0uOS0yLTJzLjktMiAyLTJzMiAuOSAyIDJzLS45IDItMiAyIiAvPjwvc3ZnPg==)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI0IDI0Ij48ZyBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiPjxwYXRoIGQ9Ik00IDEzYTggOCAwIDAgMSA3IDdhNiA2IDAgMCAwIDMtNWE5IDkgMCAwIDAgNi04YTMgMyAwIDAgMC0zLTNhOSA5IDAgMCAwLTggNmE2IDYgMCAwIDAtNSAzIiAvPjxwYXRoIGQ9Ik03IDE0YTYgNiAwIDAgMC0zIDZhNiA2IDAgMCAwIDYtM200LThhMSAxIDAgMSAwIDIgMGExIDEgMCAxIDAtMiAwIiAvPjwvZz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI0IDI0Ij48ZyBmaWxsPSJub25lIiBzdHJva2U9ImN1cnJlbnRDb2xvciIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjIiPjxwYXRoIGQ9Ik0xMiAxNXY1czMuMDMtLjU1IDQtMmMxLjA4LTEuNjIgMC01IDAtNU00LjUgMTYuNWMtMS41IDEuMjYtMiA1LTIgNXMzLjc0LS41IDUtMmMuNzEtLjg0LjctMi4xMy0uMDktMi45MWEyLjE4IDIuMTggMCAwIDAtMi45MS0uMDkiIC8+PHBhdGggZD0iTTkgMTJhMjIgMjIgMCAwIDEgMi0zLjk1QTEyLjg4IDEyLjg4IDAgMCAxIDIyIDJjMCAyLjcyLS43OCA3LjUtNiAxMWEyMi40IDIyLjQgMCAwIDEtNCAyeiIgLz48cGF0aCBkPSJNOSAxMkg0cy41NS0zLjAzIDItNGMxLjYyLTEuMDggNSAuMDUgNSAuMDUiIC8+PC9nPjwvc3ZnPg==)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI1NiAyNTYiPjxwYXRoIGZpbGw9ImN1cnJlbnRDb2xvciIgZD0iTTE1MiAyMjRhOCA4IDAgMCAxLTggOGgtMzJhOCA4IDAgMCAxIDAtMTZoMzJhOCA4IDAgMCAxIDggOG0tMjQtMTEyYTEyIDEyIDAgMSAwLTEyLTEyYTEyIDEyIDAgMCAwIDEyIDEybTk1LjYyIDQzLjgzbC0xMi4zNiA1NS42M2ExNiAxNiAwIDAgMS0yNS41MSA5LjExTDE1OC41MSAyMDBoLTYxbC0yNy4yNiAyMC41N2ExNiAxNiAwIDAgMS0yNS41MS05LjExbC0xMi4zNi01NS42M2ExNi4wOSAxNi4wOSAwIDAgMSAzLjMyLTEzLjcxbDI4LjU2LTM0LjI2YTEyMyAxMjMgMCAwIDEgOC41Ny0zNi42N2MxMi45LTMyLjM0IDM2LTUyLjYzIDQ1LjM3LTU5Ljg1YTE2IDE2IDAgMCAxIDE5LjYgMGM5LjM0IDcuMjIgMzIuNDcgMjcuNTEgNDUuMzcgNTkuODVhMTIzIDEyMyAwIDAgMSA4LjU3IDM2LjY3bDI4LjU2IDM0LjI2YTE2LjA5IDE2LjA5IDAgMCAxIDMuMzIgMTMuNzFNOTkuNDMgMTg0aDU3LjE0YzIxLjEyLTM3LjU0IDI1LjA3LTczLjQ4IDExLjc0LTEwNi44OEMxNTYuNTUgNDcuNjQgMTM0LjQ5IDI5IDEyOCAyNGMtNi41MSA1LTI4LjU3IDIzLjY0LTQwLjMzIDUzLjEyYy0xMy4zMSAzMy40LTkuMzYgNjkuMzQgMTEuNzYgMTA2Ljg4bS0xNSA1Ljg1cS0xNi4xNS0yOS4zNS0xOS42LTU3LjY5TDQ4IDE1Mi4zNkw2MC4zNiAyMDhsLjE4LS4xM1pNMjA4IDE1Mi4zNmwtMTYuODMtMjAuMnEtMy40MiAyOC4yOC0xOS41NiA1Ny42OWwyMy44NSAxOGwuMTguMTNaIiAvPjwvc3ZnPg==)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI1NiAyNTYiPjxwYXRoIGZpbGw9ImN1cnJlbnRDb2xvciIgZD0iTTE1NiAyMjhhMTIgMTIgMCAwIDEtMTIgMTJoLTMyYTEyIDEyIDAgMCAxIDAtMjRoMzJhMTIgMTIgMCAwIDEgMTIgMTJtLTI4LTExMmExNiAxNiAwIDEgMC0xNi0xNmExNiAxNiAwIDAgMCAxNiAxNm05OS41MyA0MC43bC0xMi4zNiA1NS42M2ExOS45IDE5LjkgMCAwIDEtMTIuODggMTQuNTNhMjAuMiAyMC4yIDAgMCAxLTYuNjkgMS4xNGExOS44NyAxOS44NyAwIDAgMS0xMi4yOS00LjI3TDE1Ny4xNyAyMDRIOTguODNsLTI2LjE0IDE5Ljc0QTE5Ljg3IDE5Ljg3IDAgMCAxIDYwLjQgMjI4YTIwLjIgMjAuMiAwIDAgMS02LjY5LTEuMTVhMTkuOSAxOS45IDAgMCAxLTEyLjg4LTE0LjUzTDI4LjQ3IDE1Ni43YTIwLjEgMjAuMSAwIDAgMSA0LjE2LTE3LjE0bDI3LjgzLTMzLjRhMTI3IDEyNyAwIDAgMSA4LjY1LTM2LjQ2YzEzLjI3LTMzLjI1IDM3LTU0LjEgNDYuNjQtNjEuNTJhMjAgMjAgMCAwIDEgMjQuNSAwYzkuNiA3LjQyIDMzLjM3IDI4LjI3IDQ2LjY0IDYxLjUyYTEyNyAxMjcgMCAwIDEgOC42NSAzNi40NmwyNy44MyAzMy40YTIwLjEgMjAuMSAwIDAgMSA0LjE2IDE3LjE0TTEwMS43OSAxODBoNTIuNDJjMTkuNTEtMzUuNyAyMy02OS43OCAxMC4zOS0xMDEuNEMxNTQuNCA1MyAxMzYuMiAzNS45IDEyOCAyOS4xMkMxMTkuOCAzNS45IDEwMS42IDUzIDkxLjQgNzguNmMtMTIuNjIgMzEuNjItOS4xMiA2NS43IDEwLjM5IDEwMS40bS0yMi41NSA4LjcyYTE2OCAxNjggMCAwIDEtMTYuOTItNDcuM2wtMTAgMTJsMTAuNTggNDcuNjRabTEyNC40My0zNS4zMWwtMTAtMTJhMTY4IDE2OCAwIDAgMS0xNi45MiA0Ny4zbDE2LjMzIDEyLjMzWiIgLz48L3N2Zz4=)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI1NiAyNTYiPjxnIGZpbGw9ImN1cnJlbnRDb2xvciI+PHBhdGggZD0ibTk0LjgxIDE5MmwtMjkuNDUgMjIuMjRhOCA4IDAgMCAxLTEyLjgxLTQuNTFMNDAuMTkgMTU0LjFhOCA4IDAgMCAxIDEuNjYtNi44NmwzMC4zMS0zNi4zM0M3MSAxMzQuMjUgNzYuNyAxNjEuNDMgOTQuODEgMTkybTExOS4zNC00NC43NmwtMzAuMzEtMzYuMzNjMS4yMSAyMy4zNC00LjU0IDUwLjUyLTIyLjY1IDgxLjA5bDI5LjQ1IDIyLjI0YTggOCAwIDAgMCAxMi44MS00LjUxbDEyLjM2LTU1LjYzYTggOCAwIDAgMC0xLjY2LTYuODYiIG9wYWNpdHk9Ii4yIiAvPjxwYXRoIGQ9Ik0xNTIgMjI0YTggOCAwIDAgMS04IDhoLTMyYTggOCAwIDAgMSAwLTE2aDMyYTggOCAwIDAgMSA4IDhtLTI0LTExMmExMiAxMiAwIDEgMC0xMi0xMmExMiAxMiAwIDAgMCAxMiAxMm05NS42MiA0My44M2wtMTIuMzYgNTUuNjNhMTYgMTYgMCAwIDEtMjUuNTEgOS4xMUwxNTguNTEgMjAwaC02MWwtMjcuMjYgMjAuNTdhMTYgMTYgMCAwIDEtMjUuNTEtOS4xMWwtMTIuMzYtNTUuNjNhMTYuMDkgMTYuMDkgMCAwIDEgMy4zMi0xMy43MWwyOC41Ni0zNC4yNmExMjMgMTIzIDAgMCAxIDguNTctMzYuNjdjMTIuOS0zMi4zNCAzNi01Mi42MyA0NS4zNy01OS44NWExNiAxNiAwIDAgMSAxOS42IDBjOS4zNCA3LjIyIDMyLjQ3IDI3LjUxIDQ1LjM3IDU5Ljg1YTEyMyAxMjMgMCAwIDEgOC41NyAzNi42N2wyOC41NiAzNC4yNmExNi4wOSAxNi4wOSAwIDAgMSAzLjMyIDEzLjcxTTk5LjQzIDE4NGg1Ny4xNGMyMS4xMi0zNy41NCAyNS4wNy03My40OCAxMS43NC0xMDYuODhDMTU2LjU1IDQ3LjY0IDEzNC40OSAyOSAxMjggMjRjLTYuNTEgNS0yOC41NyAyMy42NC00MC4zMyA1My4xMmMtMTMuMzEgMzMuNC05LjM2IDY5LjM0IDExLjc2IDEwNi44OG0tMTUgNS44NXEtMTYuMTUtMjkuMzUtMTkuNi01Ny42OUw0OCAxNTIuMzZMNjAuMzYgMjA4bC4xOC0uMTNaTTIwOCAxNTIuMzZsLTE2LjgzLTIwLjJxLTMuNDIgMjguMjgtMTkuNTYgNTcuNjlsMjMuODUgMThsLjE4LjEzWiIgLz48L2c+PC9zdmc+)
![](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzNiIgaGVpZ2h0PSIzNiIgdmlld2JveD0iMCAwIDI1NiAyNTYiPjxwYXRoIGZpbGw9ImN1cnJlbnRDb2xvciIgZD0iTTE1MiAyMjRhOCA4IDAgMCAxLTggOGgtMzJhOCA4IDAgMCAxIDAtMTZoMzJhOCA4IDAgMCAxIDggOG03MS42Mi02OC4xN2wtMTIuMzYgNTUuNjNhMTYgMTYgMCAwIDEtMjUuNTEgOS4xMUwxNTguNTEgMjAwaC02MWwtMjcuMjYgMjAuNTdhMTYgMTYgMCAwIDEtMjUuNTEtOS4xMWwtMTIuMzYtNTUuNjNhMTYuMDkgMTYuMDkgMCAwIDEgMy4zMi0xMy43MWwyOC41Ni0zNC4yNmExMjMgMTIzIDAgMCAxIDguNTctMzYuNjdjMTIuOS0zMi4zNCAzNi01Mi42MyA0NS4zNy01OS44NWExNiAxNiAwIDAgMSAxOS42IDBjOS4zNCA3LjIyIDMyLjQ3IDI3LjUxIDQ1LjM3IDU5Ljg1YTEyMyAxMjMgMCAwIDEgOC41NyAzNi42N2wyOC41NiAzNC4yNmExNi4wOSAxNi4wOSAwIDAgMSAzLjMyIDEzLjcxbS0xMzkuMjMgMzRxLTE2LjExLTI5LjMzLTE5LjU2LTU3LjY3TDQ4IDE1Mi4zNkw2MC4zNiAyMDhsLjE4LS4xM1pNMTQwIDEwMGExMiAxMiAwIDEgMC0xMiAxMmExMiAxMiAwIDAgMCAxMi0xMm02OCA1Mi4zNmwtMTYuODMtMjAuMnEtMy40MiAyOC4yOC0xOS41NiA1Ny42OWwyMy44NSAxOGwuMTguMTNaIiAvPjwvc3ZnPg==)

## Credits

Using an icon means following its set’s license.
[`iconify_license()`](https://noahweidig.github.io/iconifyr/reference/iconify_license.md)
returns what you need for a credit line:

``` r

sets_used <- c(
  "mdi", "tabler", "lucide", "ph", "bi", "carbon", "fa6-solid",
  "fa6-brands", "simple-icons", "logos", "twemoji", "flat-color-icons"
)
lic <- lapply(sets_used, iconify_license, quiet = TRUE)
data.frame(
  prefix = vapply(lic, `[[`, "", "prefix"),
  license = vapply(lic, `[[`, "", "license"),
  author = vapply(lic, `[[`, "", "author"),
  attribution = ifelse(vapply(lic, function(x) isTRUE(x$attribution_required), NA), "required", "-")
)
#>              prefix    license                     author attribution
#> 1               mdi Apache 2.0              Pictogrammers           -
#> 2            tabler        MIT                 Paweł Kuna           -
#> 3            lucide        ISC        Lucide Contributors           -
#> 4                ph        MIT             Phosphor Icons           -
#> 5                bi        MIT      The Bootstrap Authors           -
#> 6            carbon Apache 2.0                        IBM           -
#> 7         fa6-solid  CC BY 4.0                 Dave Gandy    required
#> 8        fa6-brands  CC BY 4.0                 Dave Gandy    required
#> 9      simple-icons    CC0 1.0 Simple Icons Collaborators           -
#> 10            logos        CC0                Gil Barbara           -
#> 11          twemoji  CC BY 4.0                    Twitter    required
#> 12 flat-color-icons        MIT                     Icons8           -
```
