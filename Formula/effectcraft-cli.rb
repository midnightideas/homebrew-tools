class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-cli-0.21.1-macos-universal.zip"
        sha256 "6072d7fc51f503ebfc3daef78ec2dbc3e7bbf400f4cd5f4f559a28371d8ceb1c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-0.21.1-linux-aarch64.tar.gz"
            sha256 "77a91020eff524617fc9db4b7443c8fc22f7874f4b0c85b74b15fa0eebc825fe"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.21.1/effectcraft-0.21.1-linux-x86_64.tar.gz"
            sha256 "ec39afa51fb0a2c0b58a8c1102325e2355016fe754563d24075fa29b3e1c5315"
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
