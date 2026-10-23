class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-cli-0.13.0-macos-universal.zip"
        sha256 "5a7d87875b8f91668da95840982b9c12022be53f5f66cb35ada35de655c1df32"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "12efbe4c18d965c54b2b848aa4321880b967370443973b42a5ca4aa0d7959248"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "598519ea2bc77c66ca9a906241e1fe3eccf745f50627ce3cdbd5b5e675a456d3"
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
