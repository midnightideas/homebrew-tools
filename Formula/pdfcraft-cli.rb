class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-cli-0.21.1-macos-universal.zip"
        sha256 "337a9f644744b57e10de41c57366e53c5ccf8840a4d5dc7322b17b9b83fdc2fa"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-linux-aarch64.tar.gz"
            sha256 "b08efe416c1da450b04b3e4ec5f0389d71d7580f4398f9eda06d33d04713c770"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-linux-x86_64.tar.gz"
            sha256 "c2919e9044effde318e66807ad2a21bbb74a9555b3c0b99f9ad0c40cf61ce25e"
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
