class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-cli-0.11.0-macos-universal.zip"
        sha256 "54f84be7d4526d1da6e88bb453f261c9988b3ea052000eb28381e78ecaa55fb7"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "4ce373f5a17f90a9f91ed01983b7683bdff544d188222a0f3addbdd1729a4fbb"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "0dad5d4b21fc8fd1192e8b854d38dcc257fae6681ae17f10f1b3f41e84488f4f"
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
