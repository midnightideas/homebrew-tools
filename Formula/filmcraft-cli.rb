class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-cli-0.9.0-macos-universal.zip"
        sha256 "793754cf8c9faa2a2272c5462533fac94d71d07a9abfb9fa29d286fd7cd70d0b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "ee0a54c2154ab34600a6d1c98a3348ac3bbcc5f44961dfa42c2c16b3a6f13c79"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.9.0/filmcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "ea67953cc754bfd8272e0e5fa940518e16068ae96f6b72a2dce566ed69a61632"
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
