class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-cli-0.19.1-macos-universal.zip"
        sha256 "1285b14823cd413ee2a666b501f8ba5076ce2ba043938143bc04bf26ec5bf0e8"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-0.19.1-linux-aarch64.tar.gz"
            sha256 "20eb8d82847e1a89cfc26eb5b804c8406e66e0c64e2bfc601236f4ad046f6b21"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.19.1/deckcraft-0.19.1-linux-x86_64.tar.gz"
            sha256 "ec75aaaef10a6dc4813f7ebf0f7fd8f980520c5b3d051ba3d76204c9e5d76fea"
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
