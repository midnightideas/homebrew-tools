class PdfcraftCli < Formula
    desc "Acrobat-style PDF viewer and editor (CLI)."
    homepage "https://github.com/storytold/pdfcraft"
    version "0.18.2"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-cli-0.18.2-macos-universal.zip"
        sha256 "34eb1ac0e366dd839adb6f3e6ed05c0a0f04957399c73dfb28e666a03ad35303"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-0.18.2-linux-aarch64.tar.gz"
            sha256 "6ac0f63a3b8ce422046053e601e44be6276d8e5576a084c0c709b0e3a3f65eb6"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-0.18.2-linux-x86_64.tar.gz"
            sha256 "323bad7b373392076461e2cad5db63b22f47a032ba005a6c4a35f3483d05dae4"
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
