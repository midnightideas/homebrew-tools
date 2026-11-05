class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-cli-0.15.1-macos-universal.zip"
        sha256 "3524a76527fc8cc57901735deab03c3c13538ecdc86a0e22037364480ad80cd5"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-0.15.1-linux-aarch64.tar.gz"
            sha256 "cbae0a38309d1c0ab50be78a37c0c92c85554410113a10247d3998a36114115c"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.15.1/figcraft-0.15.1-linux-x86_64.tar.gz"
            sha256 "d5775efadc8bb673a0b741ccda289c1ebeca6fb3f827895a40cd57ff09c474d1"
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
