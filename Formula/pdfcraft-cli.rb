class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-cli-0.19.0-macos-universal.zip"
        sha256 "633d78de4c61988e66685e922585692db8aca84f809989da1611eeba4d5d3262"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "bb7ef777f3cb8874f6028a35942a6093ae0a30eb009b5c6e5ee1247846389f11"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "3657aa40fe146d4af40fab0507c97f6ee2c6ce5ba9938567194439be3335ba8b"
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
