class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-cli-0.17.0-macos-universal.zip"
        sha256 "8c826ae5659e32c1027a7a9daf53ffcb5b6bd8f48767ea1272f6f1e32cb354f6"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "31aed5e4d7cbc1bf0d8b1da0659dcb0c6cd6114bd5783c0fdaabb16d29a273bd"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "f9814a7a0af77b905adba1c3079caedee537586797043cf5af9503914f6abec5"
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
