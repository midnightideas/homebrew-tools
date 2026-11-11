class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-cli-0.20.0-macos-universal.zip"
        sha256 "dd10f837318c3fce81f893a988de13efd7ba4be95e281f277cd7c23247aaa122"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-0.20.0-linux-aarch64.tar.gz"
            sha256 "3d796faad5b6f51046a8800c62894f7ed6cab3f7bc7850bf7e7b47c61da07e39"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-0.20.0-linux-x86_64.tar.gz"
            sha256 "1a0f29c7a6ae04916126231d843b2ea836a21b8db09f2ef416951015a437e8bc"
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
