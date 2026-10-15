class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-cli-0.7.0-macos-universal.zip"
        sha256 "be76dda3e81828f8d4a96965eac5df905dc20712bafd3cfe703ffad32cfa0ed9"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "b77591dba5f35c85ee8f227360e60bd6da342c48cc7d54394083bc2ee74768ce"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.7.0/gridcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "c01bc2dc4295556f53810dfed4a85a3f58388552c157a103e10626c069b39e1c"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to gridcraft-cli-0.7.0-macos-universal/; install just the binary.
            bin.install "gridcraft-cli-0.7.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "gridcraft-0.7.0-linux-aarch64/bin/#{name}"
        else
            bin.install "gridcraft-0.7.0-linux-x86_64/bin/#{name}"
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
