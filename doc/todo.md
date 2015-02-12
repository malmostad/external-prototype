# Sitevision Assets för responsivt SV-intranät

Samma sitevision_assets-kod som för malmo.se används. Om malmo.se och SV-intranätet divergerar för mycket framöver får vi lägga in external/internal-variabler i Grunt-bygget som väljer lite olika filer. Går det över en gräns får vi splitta repot och jobba med två kodbaser.

Fixar på malmo.se som måste göras för kompatiblitet:

* [Movies](#235)
* [Banner](#234)


## Uppdatera shared_assets i sitevision_assets:

    $ bower update

## Ändring i Sass-filer
Ändringar i movies.scss får manuellt lyftas in i motsvarande sitevision_assets, se #235:

* https://github.com/malmostad/prototypes/commit/cb7e6efb9d55861bdac65c7012026095ee1b67a1#diff-3

## Ny Sass-kod
Delar av dessa filer kan användas som grund för ny Sass-kod som behövs i sitevision_assets för startsidorna på intranätet:

* nav_page_overview.scss, kolumnlayout för översiktsmenyn
* internal-sv-crappy-start.scss, test för att försöka twinga upp stil på startsidor
* internal-start.scss, utgår ej från SV, används för att visa hur det i bästa fall kan bli

Ytterligare Sass-kod får skapas för att försöka styra upp manuellt redigerad content på startsidor efter att nyhetsmoduler och annat styrts upp.
