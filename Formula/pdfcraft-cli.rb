class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-cli-0.18.0-macos-universal.zip"
        sha256 "b5a9d4fc25116309de3613fdf39d26133b9a7cc75e35c1fa53db8308d3b3ff77"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "66c3420841371861fc38c2e8c92660585d0fe3fb782d080090c9c08bfa177ef2"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "cb3665cc45cc7aa6ba01c868b9f7c69dc4d800bef52d41cffea8bf5037c4eb6d"
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
