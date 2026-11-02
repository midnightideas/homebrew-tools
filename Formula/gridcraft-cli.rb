class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-cli-0.15.0-macos-universal.zip"
        sha256 "0fa37e85a6acdf6abc0189b25f6bfdc4bdadb1370718879892dbf7cb0a43bbec"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "90b2b21613546309bbed30365914ba9c20dd6f7d175ac7ded7e27bc68e65539a"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.15.0/gridcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "6810f8ce7394b5a7cdfaf39838257b6384dceb9f8325024d475db895ee59daaa"
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
