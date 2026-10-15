class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-cli-0.7.0-macos-universal.zip"
        sha256 "9039972bc9f583115ef79994f30179540beee1ee32d7d9bcce1054a79c9a8aa3"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "cde1f7e27468e8e0da01bc954172aa66fbea57e719c09dc2320cf4f97b326d60"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.7.0/deckcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "330a2fb2ef8890daded91084e5bfd29dfa411e33a2b27c01ac3b9e520ff98d9f"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to deckcraft-cli-0.7.0-macos-universal/; install just the binary.
            bin.install "deckcraft-cli-0.7.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "deckcraft-0.7.0-linux-aarch64/bin/#{name}"
        else
            bin.install "deckcraft-0.7.0-linux-x86_64/bin/#{name}"
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
