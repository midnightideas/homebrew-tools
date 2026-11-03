class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-cli-0.16.0-macos-universal.zip"
        sha256 "d5ca5bf587b633ec63922e39b9d9ecd5cf665c3dae4b55c8a470e2ae9315a66f"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "8c9384c6102b2f2a2d7d5e083f9bc3558d16555aef55dd4a445f142a43a89f17"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.0/gridcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "4c5c223186bd1e94fed9fedaf3cbf77a9ac96dd45a32bf36448fc023066f13df"
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
