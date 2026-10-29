class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-cli-0.18.0-macos-universal.zip"
        sha256 "e47937e21c060c1f7435669526e44ebb458ef3c762e904d701b733212bd8584d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "16afef1cf2e8ff1e48712f462f7f9732696d81f7f81978c0a7ac0f7c092aa5a8"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.18.0/effectcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "94d1d85691d54ba57fa86e04872fbcc426c33d1bd364f1fc976b1f607344880b"
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
