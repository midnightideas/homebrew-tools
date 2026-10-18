class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-cli-0.7.0-macos-universal.zip"
        sha256 "5e7bea01c9f33d13d2ad803dfd10b5f0b1815e124870db09391d1c360a58e893"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "a70838b92fd3023513b87f8667e42f8adcac6344f01c68d3394d68b1d7916039"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.7.0/figcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "f3ddf6194d2bbd523cd3195df90fa2cd5782d3946fc7833b7f6bf88fda37908d"
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
