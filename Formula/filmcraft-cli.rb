class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-cli-0.16.0-macos-universal.zip"
        sha256 "5182a2dbd9044a6e9f985665122e38f4d7e607af4fb9b7309c0aa91aec682bb5"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "8ab20c30e53d6586c3db95133c546e4562f47b94589b7610461f4351a2a6308e"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.16.0/filmcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "588390eee5d7e1634f05794c4f877ddf29494d9cf74405111d67c16cbe215ae9"
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
