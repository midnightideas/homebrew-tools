class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-cli-0.18.1-macos-universal.zip"
        sha256 "10992f73c88a4c0361dd0fec3a4d7490731ffb3ea9658ee2274b396e3341af00"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-0.18.1-linux-aarch64.tar.gz"
            sha256 "3fbd005ce382c853ad056dca7b937802fc0ef6b8564eca5a99a52b670c159e94"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.18.1/deckcraft-0.18.1-linux-x86_64.tar.gz"
            sha256 "5bae7d5566638624411ef968f2532ab3358dc280884144583e497c5631db8a26"
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
