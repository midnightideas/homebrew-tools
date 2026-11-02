class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-cli-0.16.0-macos-universal.zip"
        sha256 "bcf18369e36eaa409a2d4d67fd30eb889713bc08b9e7a30ba1967c974d1d556d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "33876da3091d66988cfac198a467b3e18e7bc91c0052e36416e886a3db1896db"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.16.0/cadcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "149820b3d0e1e729a2256e344523b9805871d39ee39c9e085f507707f73ccbd4"
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
