class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-cli-0.8.0-macos-universal.zip"
        sha256 "564f7d087b880b7f16aa60ae50a1cbe9d37b4ed449eb29b2646ea584479bab07"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "0d4c882acdcfd4b5721a6dd1ec74c98ce0fb160d0231973a69475da6ec9e8e7d"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.8.0/gridcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "4a029e20da86bad46706339ce4516a20445c131c0d82f6a114772208c5d831b3"
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
