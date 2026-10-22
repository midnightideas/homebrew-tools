class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-cli-0.9.0-macos-universal.zip"
        sha256 "3f3b46bb8ae69827ccd4c68f57a7152c68d4fdc018fd56c45f69b249f56c0630"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "02115811f8a7a48064e4e5b5e80f8b1ed6fc1b8c747630137641fdf53df7570b"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.9.0/deckcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "531b4c8cd434ca767ef21da0d44e099664af5d5d968b038bc8f927717f8fa8f1"
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
