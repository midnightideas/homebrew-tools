class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-cli-0.8.0-macos-universal.zip"
        sha256 "1093646863b659c0a40d919cb898d9d7c7a4710e488b4207540d17887e187ed0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "7325c0277d5ecce335da2dabd5dbea4d90b704edccde4d23a6423189e0bcdcc4"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.8.0/deckcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "227b8c9cdd2c06b7866807f995fe5d2d0675523a61208f9bc26cf2760fddcb8f"
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
