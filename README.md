# Tommica's Homebrew tap

Install [Difly](https://github.com/tommica/difly), a Git commit and merge GUI:

```sh
brew install tommica/tap/difly
difly /path/to/repository
```

The formula builds from source and installs its dependencies. No separate Rust installation is needed. Linux requires a graphical desktop; macOS and Linux are supported by the formula, with local installation tested on Apple Silicon macOS.

Update:

```sh
brew update
brew upgrade difly
```

For maintainers: update the formula URL and SHA-256 for each release, then run `brew audit --strict tommica/tap/difly`, `brew install --build-from-source tommica/tap/difly`, and `brew test tommica/tap/difly`.
