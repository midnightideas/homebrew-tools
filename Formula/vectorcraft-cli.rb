class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-cli-0.11.0-macos-universal.zip"
        sha256 "e8044f9f14a29b81d9563bd0b90cb655a9d7511b0f4a2e4e0c1e23ad552032af"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "fd594494e2f1498cb7dab01a3a10a70ec8ee69e8dd26a8ed468219a0f4192b53"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.11.0/vectorcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "83ca62a455bbb1d1c61c6b05133bc41ceda1d1d99e4be7509d287c364ceb8f39"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to vectorcraft-cli-0.11.0-macos-universal/; install just the binary.
            bin.install "vectorcraft-cli-0.11.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "vectorcraft-0.11.0-linux-aarch64/bin/#{name}"
        else
            bin.install "vectorcraft-0.11.0-linux-x86_64/bin/#{name}"
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
