class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.23.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-cli-0.23.1-macos-universal.zip"
        sha256 "405ea3a2ead24ae4dabfda3bf383fc61baa6c2ad4414666eb419d9594df94721"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-0.23.1-linux-aarch64.tar.gz"
            sha256 "fff8ed752b90d63c1e491f6cc6d2700fc7122fc15e1fab674000065052bef3fe"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.23.1/effectcraft-0.23.1-linux-x86_64.tar.gz"
            sha256 "a330d1406fde71d07ac55ad37fe81f5de37ec7ea7ca7c3b9fa02aacd04502db1"
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
