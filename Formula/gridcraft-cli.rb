class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-cli-0.11.1-macos-universal.zip"
        sha256 "5a1bde181fc38e09e3c3661c33d6b8e924032dc0950de2ba236913294ed3a653"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-0.11.1-linux-aarch64.tar.gz"
            sha256 "16e4da4873867a9080ec41d76e38430a8d0e62fa22b43edb6d7b1dbde0925435"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.11.1/gridcraft-0.11.1-linux-x86_64.tar.gz"
            sha256 "f2c83e6c26449a6c45983e903bf32c1d4c302b2042f263ead995271129c70e87"
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
