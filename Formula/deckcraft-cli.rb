class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-cli-0.15.1-macos-universal.zip"
        sha256 "511fec801f2865b1d9751a07a7be637abf4788faeb4163d075459d941b413877"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-linux-aarch64.tar.gz"
            sha256 "d1205205b6dcbc9979e8da1275941cb08b94dc51920bec1fb986bbf99263bcdf"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.1/deckcraft-0.15.1-linux-x86_64.tar.gz"
            sha256 "e2d45129d4b0f5d282232455b73b35d2dc16a4f587bf69a1db80939b0ade78cd"
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
