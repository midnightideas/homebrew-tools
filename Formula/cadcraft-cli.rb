class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-cli-0.12.0-macos-universal.zip"
        sha256 "4d2004635e17f4ab74a5b1c72f34f67f8f90a04f4a20ded7cc8d49c4e6f70991"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "29a674e41223c18532359c38f2afc936dde1aa774e2c6479ca1246d3f3bf97f6"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.12.0/cadcraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "6ae27b9eabc3608caef356a00f69b9fdccbf1e408d6308b5614b6e6b256308de"
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
