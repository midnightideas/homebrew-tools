class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-cli-0.10.0-macos-universal.zip"
        sha256 "2ec7409994271bb0b51c4ca9c5b9737aa8a4a70cb3ea2c99508c7e0adf1d1a20"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "96494730880b30fbf2cf1d74cb822fdcbcd36f59eee877c445f948f4978684a2"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.10.0/cadcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "2bf13abe4645655c971d452304c06f98081849ace86a3289fc991bec55392d18"
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
