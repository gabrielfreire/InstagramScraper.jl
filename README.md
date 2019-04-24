# InstagramScraper

- This is a toy package i made while learning the Julia Programming Language.
- It scrapes an instagram profile page and prints the amount of followers

# Requirements
to run julia `./src/InstagramScraper.jl` file
- run `git clone https://github.com/gabrielfreire/InstagramScraper.jl.git`
```julia
using Pkg
Pkg.add("HTTP")
Pkg.add("Cascadia")
Pkg.add("Gumbo")
```
to run julia `./BuildScript.jl` file
```julia
using Pkg
Pkg.add("PackageCompiler")
```
# Run Julia
**usage**
```bash
julia InstagramScraper.jl prof_name1 prof_name2 prof_name3 ...
```
**try**
```bash
julia InstagramScraper.jl gabrielfreiredev freire.tatyana
```
**output**
```
gabrielfreiredev has 2270 followers
freire.tatyana has 898 followers
```

# Build executable
```shell
julia BuildScript.jl
```
Or just uncompress the file `./build/build.7z` inside `./build` folder

# Run Manual Test
You need to build/uncompress the executable in order to run this script
```shell
bash manually_test.sh
```

# TODO
- Scrape more Data on Instagram