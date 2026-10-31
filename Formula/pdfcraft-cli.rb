class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.16.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-cli-0.16.1-macos-universal.zip"
        sha256 "c12d83c4a805171e1d19b6aec79d4272239cd6a67ec9e7efba2943d9fbe3c39c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-0.16.1-linux-aarch64.tar.gz"
            sha256 "2908e9127bf80f0bf889bd4c292980bc06e47f74999a5bf6dd09357e6f4e58a4"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-0.16.1-linux-x86_64.tar.gz"
            sha256 "bb36e071d10a14af5121299a0eed8d7c5db8e5c7580b6cbebec085c41d1bfe0a"
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
