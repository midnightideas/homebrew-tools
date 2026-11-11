class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-cli-0.19.0-macos-universal.zip"
        sha256 "1461679ccbef12e3f343ef24cce48b1ed473bb6285da8acdb3f8c2368cb7d3cd"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "7e9e857325be2b6197b57e2a21fcf8faf45fa42644c79eebed1fb734c3f8bed7"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.19.0/filmcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "76149343c19700ba6ac905fde8a019e0917d06507f426a5938396d97a1ca2124"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
        elsif Hardware::CPU.arm?
            bin.install "bin/#{name}"
        else
            bin.install "bin/#{name}"
        end
    end

    test do
        assert_predicate bin/"#{name}", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
