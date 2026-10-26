class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-cli-0.13.0-macos-universal.zip"
        sha256 "d77d94f2efc3ed88d0c10189d9707ca87ccffed41008f995d40b892b84479994"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "e55061da7f46dd1465379ac071eb854993722f4ece87ef1a8b70b265927b6894"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.13.0/filmcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "40e9d685fb3ed1b0a21c9c02211f1a8499e09a47c551244ce7ee80f2584d3a9b"
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
