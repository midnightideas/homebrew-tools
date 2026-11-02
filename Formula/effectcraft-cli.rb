class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-cli-0.20.0-macos-universal.zip"
        sha256 "adc713ed5049983bec00c651f307e122074ac542ca48e6a43011dfbfb0f10e16"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-0.20.0-linux-aarch64.tar.gz"
            sha256 "cdc1fcbb8cc20cba328b8b79db69f7df459be32c75187ac05ae2138fe4b42050"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.20.0/effectcraft-0.20.0-linux-x86_64.tar.gz"
            sha256 "2573100a0a2ce07a69257bda7fa6a7d5252d3b4d32dfef3a1f6d2c95bcb8da23"
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
