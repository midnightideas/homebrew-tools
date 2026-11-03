class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-cli-0.15.0-macos-universal.zip"
        sha256 "a46be9178b59b9044859f93d9bb08bceb747abcf82fe2fb92166449830e3750f"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "59c886bda7bb9133d77926a53282024c33a1f82f4e929f54eb8f9fa39c9220db"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.15.0/deckcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "4e39a80452c42ec2e00122586f088a9ab27503249ae67cf4bdb13910d4a3aee4"
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
