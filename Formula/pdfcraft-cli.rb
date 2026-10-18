class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-cli-0.9.0-macos-universal.zip"
        sha256 "c20b8ced630417d47042ee37282fdb8362a29ebbc0b0bec3f4f635d0e28545f0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "7c83035ebe5c6dc10649e76f5202017ac2da0de48f24db7f87fcaf09adf42619"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "ff5f7da36a1089340e3fdba696b286cc317ac8f0705cc8c44c1c49d9ca4c54e0"
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
