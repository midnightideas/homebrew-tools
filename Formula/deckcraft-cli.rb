class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    name "DeckCraft CLI"
    version "0.6.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-cli-0.6.1-macos-universal.zip"
        sha256 "38d95bb1b7a9c126366b4c18205136742525f3114223dde945e5f114b8077c28"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-0.6.1-linux-aarch64.tar.gz"
            sha256 "686b51d14dee18d505fcfc1ce5dd42b93de42350735d55311793a63f44f1b145"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.6.1/deckcraft-0.6.1-linux-x86_64.tar.gz"
            sha256 "1215e64f11aa68529be3efe2078f51c39a7669de1d63cce1b558ac1193f17569"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to deckcraft-cli-0.6.1-macos-universal/; install just the binary.
            bin.install "deckcraft-cli-0.6.1-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "deckcraft-0.6.1-linux-aarch64/bin/#{name}"
        else
            bin.install "deckcraft-0.6.1-linux-x86_64/bin/#{name}"
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
