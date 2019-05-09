# InstagramScraper

- This is a toy package i made while learning the Julia Programming Language.
- It scrapes an instagram profile page and prints the amount of followers

# Requirements
to run julia `./src/InstagramScraper.jl` file
- run `git clone https://github.com/gabrielfreire/InstagramScraper.jl.git`

to run julia `./src/compile.jl` file
```julia
Julia > using Pkg
Julia > Pkg.add("ApplicationBuilder")
```
# Run Julia
**usage**
```shell
$ julia InstagramScraper.jl prof_name1 prof_name2 prof_name3 ...
```
**try**
```shell
$ julia InstagramScraper.jl gabrielfreiredev freire.tatyana
```
**output**
```
        ------------------------------------------

        NAME:   Gabriel Freire
        URL:    https://www.instagram.com/gabrielfreiredev
        PERSONAL URL:   http://www.gabrielfreire.com.br/
        FOLLOWERS:      2274
        ------------------------------------------

        ------------------------------------------

        NAME:   Tatyana Freire
        URL:    https://www.instagram.com/freire.tatyana
        PERSONAL URL:   No personal URL
        FOLLOWERS:      902
        ------------------------------------------
```

# Build executable
```shell
$ julia src/compile.jl
```

# Run Unit Tests
```shell
$ julia test/runtests.jl
```
# Run Manual Test
You need to build/uncompress the executable in order to run this script
```shell
$ bash run.sh
```

# TODO
- Scrape more Data on Instagram