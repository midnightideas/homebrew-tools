class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-cli-0.21.0-macos-universal.zip"
        sha256 "bb778f9db8b76e7e8c11acf4a35650a78022899542e934e11ad588e9946a6942"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-0.21.0-linux-aarch64.tar.gz"
            sha256 "5326f1a7f6b368b4872deb2d3e6f5b136a6ebb50c23c2bcd9ffb9e0fb222cb32"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.0/effectcraft-0.21.0-linux-x86_64.tar.gz"
            sha256 "03fbc998a9790fa949b9033359740ce6610db7d19426f0f3802f53ea70cb824d"
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
