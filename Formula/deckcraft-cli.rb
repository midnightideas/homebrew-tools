class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-cli-0.17.0-macos-universal.zip"
        sha256 "9ab99fbcfcf8365546f9808a34279bbdf7a7edee024222bda238e307e4081bbc"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "23ca94384bd08a9742eba17b162b3cb48d520eac80628fc23b79a551a15c3706"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.17.0/deckcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "a61a05095a52a80990aa8990b447100553e99c8fa6edc8754aa52740a1a6f9b0"
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
