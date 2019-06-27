# InstagramScraper

- This is a toy package i made while learning the Julia Programming Language.
- It scrapes an instagram profile page and prints the amount of followers

# Requirements
to run julia `./src/InstagramScraper.jl` file
- run `git clone https://github.com/gabrielfreire/InstagramScraper.jl.git`

to run julia `./compile.jl` file
```julia
Julia > using Pkg
Julia > Pkg.add("https://github.com/gabrielfreire/ApplicationBuilder.jl.git")
Julia > Pkg.add("SnoopCompile")
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
$ julia compile.jl
```

# Run Unit Tests
```shell
$ julia test/runtests.jl
```

# TODO
- Scrape more Data on Instagram