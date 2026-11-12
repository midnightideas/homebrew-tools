class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.24.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-cli-0.24.1-macos-universal.zip"
        sha256 "2781eda194372ad47f4c0c7df8b1d38501a3e90bb499282f57e9598a85958673"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-linux-aarch64.tar.gz"
            sha256 "ad10c445065681760de9353117c6e2c45167eabcccf0ed19bde2f5c5ac908695"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.24.1/effectcraft-0.24.1-linux-x86_64.tar.gz"
            sha256 "5ce0393690144227fa9186e82308ad638a6ef6d9f976c996e6d03b5b51b65a7b"
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
