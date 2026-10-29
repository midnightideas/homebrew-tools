class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-cli-0.13.0-macos-universal.zip"
        sha256 "3db52969cf7621fdfdaebd123f72d5b1de343f63d3b52ec5a4a964f5605986ac"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "ecbef0d833caea65f6879714e037753578344bbc3ad7ad71da0f59449fc2aa6d"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.13.0/gridcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "20c6c56ec1ffd6bbcffee6cdee58cf6b5cadd2f4a04a4360dd7cc64d53ad97e5"
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
