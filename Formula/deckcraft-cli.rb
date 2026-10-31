class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-cli-0.13.1-macos-universal.zip"
        sha256 "9a120a65f231abbd487dcd9529eded3038169ec7d4d9e6979a6e13eb2f859ffc"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-linux-aarch64.tar.gz"
            sha256 "ff25d0c8468bcdd35b6527603f3e57b479741cc70dffd1261acac83fb41d9f03"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.13.1/deckcraft-0.13.1-linux-x86_64.tar.gz"
            sha256 "711ec095b590fbcbaaabc8c5925a8350dea98ee931ab7b44d48af68b2e61f514"
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
