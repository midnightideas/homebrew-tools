class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-cli-0.22.0-macos-universal.zip"
        sha256 "d9b8a88070895e6d5ccf3cc53d1de353622b60bd8af993e1c3959b4be1caf0da"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-0.22.0-linux-aarch64.tar.gz"
            sha256 "ce137726550158e22c887cb8f71001e3b29d1741aea7492e0f0ff49054e2fe03"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-0.22.0-linux-x86_64.tar.gz"
            sha256 "a8993f9ee96e87accecf90af4226ff60a84b9e1787ae9fd8fa48ffe1396bc35e"
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
