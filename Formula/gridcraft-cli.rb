class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.14.2"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-cli-0.14.2-macos-universal.zip"
        sha256 "79ce97d3cc1746a1d420ba59c90bcd3d01a27b00009b8627a0dc90cca4be5941"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-linux-aarch64.tar.gz"
            sha256 "bc2cfbbc93483ed8c487f55007f8b88c12bd7806f12098446af850d02c92e307"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.14.2/gridcraft-0.14.2-linux-x86_64.tar.gz"
            sha256 "9c8153b7630adfbdef8021aa9b982e1ef187b6cf27cd2233280cfaf0ba6a1842"
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
