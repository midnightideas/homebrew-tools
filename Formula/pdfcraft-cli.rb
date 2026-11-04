class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-cli-0.18.1-macos-universal.zip"
        sha256 "086b233ad7c2bdc172bf8c0e359855fde7c6bdd69a5bd19efb47f08920cfeb7d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-0.18.1-linux-aarch64.tar.gz"
            sha256 "7b9920b9d8c4ccbc362cd7e8cc6f939feaf23fac78b1a8b88791d8d4c93ff01c"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-0.18.1-linux-x86_64.tar.gz"
            sha256 "41a6b9fb16970cd3610d05d985997002e419bf5278f86af6ab480783f89bf1fc"
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
