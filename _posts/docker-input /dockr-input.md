Docker Hub Linux Ubunto
================
Lyder Aleksander Mathisen

``` r
knitr::opts_chunk$set(echo = TRUE)
```

``` r
library(tidyverse)
```

    ## ── Attaching packages ───────────────────────────────────────────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5          ✓ purrr   0.3.4.9000
    ## ✓ tibble  3.1.6          ✓ dplyr   1.0.7     
    ## ✓ tidyr   1.1.4          ✓ stringr 1.4.0     
    ## ✓ readr   2.1.1          ✓ forcats 0.5.1

    ## ── Conflicts ──────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(fs)
library(here)
```

    ## here() starts at /home/lyder/dev_lyder/dsatcl2e-data

``` r
library(pacman)
library(arrow)
```

    ## See arrow_info() for available features

    ## 
    ## Attaching package: 'arrow'

    ## The following object is masked from 'package:utils':
    ## 
    ##     timestamp

``` r
library(reprex)
```

# Docker

**NB** *Artikkel ikke fullstendig versjon. Denne versjonen er kun
utkast.*

I dette dokumentet vil jeg fortelle om hvordan jeg kom i gang med
`Docker`. Fra en utrolig bra skrevet vignette som tar for seg hele
installasjonen via terminalen på en Linux Ubuntu maskin. Resultatet er
at jeg nå har `Docker` tilgjengelig, jeg kan de aller mest nødvendige
kommandoene og jeg har laget en `Docker` Header bestående av en Ubuntu
Distribusjon med `node.js`. Alt dette har jeg også klart å pushe til
repoen på min `Docker` Hub konto.

Artikkelen jeg fulgte, [install configure docker
ubuntu](https://linuxhint.com/install_configure_docker_ubuntu/), er
skrevet av linuxhint.com som forøvrig har utrolig bra artikler og
veiledninger. Ganske ofte foretrekker jeg lese disse enn å se en Youtube
video.

## Hvorfor Docker?

Årsaken til at jeg lastet ned `Docker` er fordi jeg leser en bok hvor
forfatteren eksplisitt ber alle som leser boka om å bruke `Docker`. Det
er fordi `Docker` bringer noen helt unike egenskaper, som gjør miljøet
du koder i, og alle elementene som filer, programmer, mapper etc.
nødvendig for prosjektet ditt tilgjengelig. Det virker på mange måter
som en `viritual box machine`.

Uten at jeg skal dra den for langt med å uttale meg om relativt
komplekse temaer, vil jeg heller fokusere på hvordan jeg lastet `Docker`
ned, hvilke fordeler jeg spesifikt vil ha nytte for med `Docker`, og
påpeke hva jeg personlig oppfatter som viktig i installasjons prosessen.

Min anbefaling er å bruke artikkelen til å gjennomføre de første stegene
i starten. Det er i utgangspunktet rett frem og simpelt.

## Hva jeg mener er viktig

Når du har lastet ned `Docker`, og den er tilgjengelig så er det et par
ting du kan gjøre.

``` bash
sudo systemctl status docker 

sudo usermod -aG docker ${USER}
sudo usermod -aG docker {$USER} # fish
```

Her viser jeg hvordan du kan få nyttig info om hvordan du skal bruke
`Docker.`

Det holder å skrive bare `Docker` i terminalen, men jeg har under
skrevet den fullstendige.

``` bash
docker COMMAND --help
```

    ## 
    ## Usage:  docker [OPTIONS] COMMAND
    ## 
    ## A self-sufficient runtime for containers
    ## 
    ## Options:
    ##       --config string      Location of client config files (default
    ##                            "/home/lyder/.docker")
    ##   -c, --context string     Name of the context to use to connect to the
    ##                            daemon (overrides DOCKER_HOST env var and
    ##                            default context set with "docker context use")
    ##   -D, --debug              Enable debug mode
    ##   -H, --host list          Daemon socket(s) to connect to
    ##   -l, --log-level string   Set the logging level
    ##                            ("debug"|"info"|"warn"|"error"|"fatal")
    ##                            (default "info")
    ##       --tls                Use TLS; implied by --tlsverify
    ##       --tlscacert string   Trust certs signed only by this CA (default
    ##                            "/home/lyder/.docker/ca.pem")
    ##       --tlscert string     Path to TLS certificate file (default
    ##                            "/home/lyder/.docker/cert.pem")
    ##       --tlskey string      Path to TLS key file (default
    ##                            "/home/lyder/.docker/key.pem")
    ##       --tlsverify          Use TLS and verify the remote
    ##   -v, --version            Print version information and quit
    ## 
    ## Management Commands:
    ##   app*        Docker App (Docker Inc., v0.9.1-beta3)
    ##   builder     Manage builds
    ##   buildx*     Docker Buildx (Docker Inc., v0.7.1-docker)
    ##   config      Manage Docker configs
    ##   container   Manage containers
    ##   context     Manage contexts
    ##   image       Manage images
    ##   manifest    Manage Docker image manifests and manifest lists
    ##   network     Manage networks
    ##   node        Manage Swarm nodes
    ##   plugin      Manage plugins
    ##   scan*       Docker Scan (Docker Inc., v0.12.0)
    ##   secret      Manage Docker secrets
    ##   service     Manage services
    ##   stack       Manage Docker stacks
    ##   swarm       Manage Swarm
    ##   system      Manage Docker
    ##   trust       Manage trust on Docker images
    ##   volume      Manage volumes
    ## 
    ## Commands:
    ##   attach      Attach local standard input, output, and error streams to a running container
    ##   build       Build an image from a Dockerfile
    ##   commit      Create a new image from a container's changes
    ##   cp          Copy files/folders between a container and the local filesystem
    ##   create      Create a new container
    ##   diff        Inspect changes to files or directories on a container's filesystem
    ##   events      Get real time events from the server
    ##   exec        Run a command in a running container
    ##   export      Export a container's filesystem as a tar archive
    ##   history     Show the history of an image
    ##   images      List images
    ##   import      Import the contents from a tarball to create a filesystem image
    ##   info        Display system-wide information
    ##   inspect     Return low-level information on Docker objects
    ##   kill        Kill one or more running containers
    ##   load        Load an image from a tar archive or STDIN
    ##   login       Log in to a Docker registry
    ##   logout      Log out from a Docker registry
    ##   logs        Fetch the logs of a container
    ##   pause       Pause all processes within one or more containers
    ##   port        List port mappings or a specific mapping for the container
    ##   ps          List containers
    ##   pull        Pull an image or a repository from a registry
    ##   push        Push an image or a repository to a registry
    ##   rename      Rename a container
    ##   restart     Restart one or more containers
    ##   rm          Remove one or more containers
    ##   rmi         Remove one or more images
    ##   run         Run a command in a new container
    ##   save        Save one or more images to a tar archive (streamed to STDOUT by default)
    ##   search      Search the Docker Hub for images
    ##   start       Start one or more stopped containers
    ##   stats       Display a live stream of container(s) resource usage statistics
    ##   stop        Stop one or more running containers
    ##   tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
    ##   top         Display the running processes of a container
    ##   unpause     Unpause all processes within one or more containers
    ##   update      Update configuration of one or more containers
    ##   version     Show the Docker version information
    ##   wait        Block until one or more containers stop, then print their exit codes
    ## 
    ## Run 'docker COMMAND --help' for more information on a command.
    ## 
    ## [1mTo get more help with docker, check out our guides at https://docs.docker.com/go/guides/[0m

**Viktig presisering:** Etter man har lastet ned `Docker` og skal bruke
det fremover, så må du logge den inn som admin i systemet.

Du må bli en `Sudu.` Du kan enkelt gjøre det med `su - {\$USER}` eller
`su - \${USER}` avhengig om du bruker `fish` eller ikke som shell.

Da vil kommandoer som dette fungere:

``` bash
ducker search ubuntu 
```

Det `Docker` gjør i koden ovenfor er å søke etter tilgjengelige Hubs som
inneholder “ubuntu”. Dette kan videre brukes til å søke etter andre ting
også. Eksempelvis kan du skrive `docker search r-studio` og få en output
med informasjon om hvilke som er tilgjengelig. Output i terminalen har
en struktur hvor det er 5 kolonner;

**`NAME      DESCRIPTION   STARS     OFFICIAL   AUTOMATED`**

<summary>

# Session info

</summary>

``` r
sessioninfo::session_info()
```

    ## ─ Session info ─────────────────────────────────────────────────────────────────────────────────────────────────────
    ##  setting  value
    ##  version  R version 4.1.2 (2021-11-01)
    ##  os       Ubuntu 20.04.3 LTS
    ##  system   x86_64, linux-gnu
    ##  ui       RStudio
    ##  language (EN)
    ##  collate  en_US.UTF-8
    ##  ctype    en_US.UTF-8
    ##  tz       Europe/Oslo
    ##  date     2022-01-09
    ##  rstudio  2021.09.1+372 Ghost Orchid (desktop)
    ##  pandoc   2.14.0.3 @ /usr/lib/rstudio/bin/pandoc/ (via rmarkdown)
    ## 
    ## ─ Packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────
    ##  package     * version     date (UTC) lib source
    ##  arrow       * 6.0.1       2021-11-20 [1] CRAN (R 4.1.2)
    ##  assertthat    0.2.1       2019-03-21 [1] CRAN (R 4.1.2)
    ##  backports     1.4.1       2021-12-13 [1] CRAN (R 4.1.2)
    ##  bit           4.0.4       2020-08-04 [1] CRAN (R 4.1.2)
    ##  bit64         4.0.5       2020-08-30 [1] CRAN (R 4.1.2)
    ##  broom         0.7.10      2021-10-31 [1] CRAN (R 4.1.2)
    ##  cellranger    1.1.0       2016-07-27 [1] CRAN (R 4.1.2)
    ##  cli           3.1.0       2021-10-27 [1] CRAN (R 4.1.2)
    ##  colorspace    2.0-2       2021-06-24 [1] CRAN (R 4.1.2)
    ##  crayon        1.4.2       2021-10-29 [1] CRAN (R 4.1.2)
    ##  DBI           1.1.2.9000  2022-01-05 [1] Github (r-dbi/DBI@90b72cb)
    ##  dbplyr        2.1.1       2021-04-06 [1] CRAN (R 4.1.2)
    ##  digest        0.6.29      2021-12-01 [1] CRAN (R 4.1.2)
    ##  dplyr       * 1.0.7       2021-06-18 [1] CRAN (R 4.1.2)
    ##  ellipsis      0.3.2       2021-04-29 [1] CRAN (R 4.1.2)
    ##  evaluate      0.14        2019-05-28 [1] CRAN (R 4.1.2)
    ##  fansi         0.5.0       2021-05-25 [1] CRAN (R 4.1.2)
    ##  fastmap       1.1.0       2021-01-25 [1] CRAN (R 4.1.2)
    ##  forcats     * 0.5.1       2021-01-27 [1] CRAN (R 4.1.2)
    ##  fs          * 1.5.2.9000  2021-12-25 [1] Github (r-lib/fs@6d1182f)
    ##  generics      0.1.1       2021-10-25 [1] CRAN (R 4.1.2)
    ##  ggplot2     * 3.3.5       2021-06-25 [1] CRAN (R 4.1.2)
    ##  glue          1.6.0       2021-12-17 [1] CRAN (R 4.1.2)
    ##  gtable        0.3.0       2019-03-25 [1] CRAN (R 4.1.2)
    ##  haven         2.4.3       2021-08-04 [1] CRAN (R 4.1.2)
    ##  here        * 1.0.1       2020-12-13 [1] CRAN (R 4.1.2)
    ##  hms           1.1.1       2021-09-26 [1] CRAN (R 4.1.2)
    ##  htmltools     0.5.2       2021-08-25 [1] CRAN (R 4.1.2)
    ##  httr          1.4.2       2020-07-20 [1] CRAN (R 4.1.2)
    ##  jsonlite      1.7.2       2020-12-09 [1] CRAN (R 4.1.2)
    ##  knitr         1.37        2021-12-16 [1] CRAN (R 4.1.2)
    ##  lifecycle     1.0.1       2021-09-24 [1] CRAN (R 4.1.2)
    ##  lubridate     1.8.0       2021-10-07 [1] CRAN (R 4.1.2)
    ##  magrittr      2.0.1       2020-11-17 [1] CRAN (R 4.1.2)
    ##  modelr        0.1.8       2020-05-19 [1] CRAN (R 4.1.2)
    ##  munsell       0.5.0       2018-06-12 [1] CRAN (R 4.1.2)
    ##  pacman      * 0.5.1       2019-03-11 [1] CRAN (R 4.1.2)
    ##  pillar        1.6.4       2021-10-18 [1] CRAN (R 4.1.2)
    ##  pkgconfig     2.0.3       2019-09-22 [1] CRAN (R 4.1.2)
    ##  purrr       * 0.3.4.9000  2021-12-28 [1] Github (tidyverse/purrr@5aca9df)
    ##  R6            2.5.1       2021-08-19 [1] CRAN (R 4.1.2)
    ##  Rcpp          1.0.7       2021-07-07 [1] CRAN (R 4.1.2)
    ##  readr       * 2.1.1       2021-11-30 [1] CRAN (R 4.1.2)
    ##  readxl        1.3.1       2019-03-13 [1] CRAN (R 4.1.2)
    ##  reprex      * 2.0.1       2021-08-05 [1] CRAN (R 4.1.2)
    ##  rlang         0.99.0.9003 2022-01-09 [1] Github (r-lib/rlang@9632b86)
    ##  rmarkdown     2.11        2021-09-14 [1] CRAN (R 4.1.2)
    ##  rprojroot     2.0.2       2020-11-15 [1] CRAN (R 4.1.2)
    ##  rstudioapi    0.13        2020-11-12 [1] CRAN (R 4.1.2)
    ##  rvest         1.0.2       2021-10-16 [1] CRAN (R 4.1.2)
    ##  scales        1.1.1       2020-05-11 [1] CRAN (R 4.1.2)
    ##  sessioninfo   1.2.2       2021-12-06 [1] CRAN (R 4.1.2)
    ##  stringi       1.7.6       2021-11-29 [1] CRAN (R 4.1.2)
    ##  stringr     * 1.4.0       2019-02-10 [1] CRAN (R 4.1.2)
    ##  tibble      * 3.1.6       2021-11-07 [1] CRAN (R 4.1.2)
    ##  tidyr       * 1.1.4       2021-09-27 [1] CRAN (R 4.1.2)
    ##  tidyselect    1.1.1       2021-04-30 [1] CRAN (R 4.1.2)
    ##  tidyverse   * 1.3.1       2021-04-15 [1] CRAN (R 4.1.2)
    ##  tzdb          0.2.0       2021-10-27 [1] CRAN (R 4.1.2)
    ##  utf8          1.2.2       2021-07-24 [1] CRAN (R 4.1.2)
    ##  vctrs         0.3.8       2021-04-29 [1] CRAN (R 4.1.2)
    ##  withr         2.4.3       2021-11-30 [1] CRAN (R 4.1.2)
    ##  xfun          0.29        2021-12-14 [1] CRAN (R 4.1.2)
    ##  xml2          1.3.3       2021-11-30 [1] CRAN (R 4.1.2)
    ##  yaml          2.2.1       2020-02-01 [1] CRAN (R 4.1.2)
    ## 
    ##  [1] /home/lyder/R/x86_64-pc-linux-gnu-library/4.1
    ##  [2] /usr/local/lib/R/site-library
    ##  [3] /usr/lib/R/site-library
    ##  [4] /usr/lib/R/library
    ## 
    ## ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

</details>
