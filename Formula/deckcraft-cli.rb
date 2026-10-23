class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-cli-0.10.0-macos-universal.zip"
        sha256 "7c4553a096d2abf7a2b3feb43affc6fcf7f188f035b055b60a9a707b5f690ddb"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "7be0594d90c4c0be15b812a597b85f6005271716be778b2999cb492f52c8676b"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.10.0/deckcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "546616eb2300ce8efb20b44a53e60abfe6b96d71ac606b452a36fd21c6b1ff28"
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
