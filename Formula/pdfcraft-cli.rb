class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-cli-0.15.0-macos-universal.zip"
        sha256 "0304db20f3597e4e9ad3044d67f79cb89bdad49833c6ad7a60c0d0d6a7afaa50"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "b380bc7a4c28d05d7ea95eb23085ca322c49ca1a21b8bb79389a8e083ae92b9d"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "b167a18c60a7b329f05a5bbf97e32dc678aad3f8d5866d8e4378ff24273f8313"
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
