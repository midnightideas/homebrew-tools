class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-cli-0.14.0-macos-universal.zip"
        sha256 "1e960d104ffa58fb346c071c9723e1a7014d60e4c93b7d57d466c724323adcb2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "fe6711b5e211bc01405f3dad799f252f4e1b2cc976b7c47f83fe7a97cebe9838"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "a93f511e87f63036ca5f5300b1a7a18a3cd2285205deab15394caa6ee83c6f1f"
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
