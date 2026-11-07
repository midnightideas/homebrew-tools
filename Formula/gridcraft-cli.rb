class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-cli-0.17.0-macos-universal.zip"
        sha256 "d792615873fa4f742e0eb28779d92e53671191669225a11921e3cd51460259d7"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "e0531c45b19b8bf92493abc1cecb1c485fd3e72811eb08a81e5be0e5f8604140"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.17.0/gridcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "14e9374555bc6d2d9c5bc41bb31150bc6a1cb6b4e83d5ab4163fd5d7611b0618"
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
