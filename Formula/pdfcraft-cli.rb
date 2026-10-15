class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-cli-0.8.0-macos-universal.zip"
        sha256 "8151d648892589a33ec474ec1eae5fcc57a8932d92b1c9566bc7dd0a5725024b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "48e180c8896512ed1b10892baf95a75df4bbd866f7205150662cb47da2a4bf97"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "3f4fd5ddd99802a3d349474c61cf3dabd1fb7198ea0df00d24cc310516bd1c2a"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to pdfcraft-cli-0.8.0-macos-universal/; install just the binary.
            bin.install "pdfcraft-cli-0.8.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "pdfcraft-0.8.0-linux-aarch64/bin/#{name}"
        else
            bin.install "pdfcraft-0.8.0-linux-x86_64/bin/#{name}"
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
