class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-cli-0.17.1-macos-universal.zip"
        sha256 "c5d6c2538039079dc757315aebb3028d3574f346d9874caa427c15597b98fe4a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-linux-aarch64.tar.gz"
            sha256 "4a7a4f67d7734664f157720b1d7c68e37fb8a18a96509c7c620cab59a3775356"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.1/cadcraft-0.17.1-linux-x86_64.tar.gz"
            sha256 "dda165a2f2ee6e1ef49c7cc0257b5e0382deb541d8eae02113176882f9f2ec00"
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
