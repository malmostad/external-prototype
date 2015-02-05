# Sitevision Assets för responsivt SV-intranät

Samma sitevision_assets-kod som för malmo.se används. Om malmo.se och SV-intranätet divergerar för mycket framöver får vi lägga in external/internal-variabler i Grunt-bygget som väljer olika filer. Går det över en gräns får vi splitta repot.

Fixar på malmo.se som måste göras för kompatiblitet:
* [Movies](https://github.com/malmostad/sitevision_assets/issues/235)
* [Banner](https://github.com/malmostad/sitevision_assets/issues/234)

Uppdatera shared_assets i sitevision_assets:

    $ bower update

Ändring i Sass-filer:

* https://github.com/malmostad/prototypes/commit/cb7e6efb9d55861bdac65c7012026095ee1b67a1#diff-3

Nya filer:

* internal-sv-crappy-start.scss
* internal-start.scss
* nav_page_overview.scss
