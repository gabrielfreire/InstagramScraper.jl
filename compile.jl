using PackageCompiler;

# Build an executable from the Package
PackageCompiler.build_executable("src/InstagramScraper.jl", snoopfile="src/call_functions.jl", builddir="build/")

