class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-cli-0.16.0-macos-universal.zip"
        sha256 "48a0f350fccd1ac22d744645f09cba00f9795ed3c4ef1273c67551387ccdf63b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "442393770be3eb6458e6712a332496fcf372b107b1efe36077ba39fa3b9e90ca"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.16.0/figcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "d5e7f99f49d3a703d7f5241854dc756fb3d55fc94d0c95d2970db84a33391f5a"
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
