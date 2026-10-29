class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-cli-0.12.0-macos-universal.zip"
        sha256 "dfd374a5af7139344bf06fbb52beb6f0f255e54276ae20b5d457ce4f958a8322"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "2312f1c0e0bf131faa525d71d265ba07734227fd2d174afbea00e95bcf93d353"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.12.0/deckcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "4a410d3caa423e873d0dcab51c98e06588f55bdfcf03e9c1e91409a86c08de3e"
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
