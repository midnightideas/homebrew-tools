cask "pdfcraft" do
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-macos-universal.dmg"
        sha256 "1adc9bf3d319e707e9247004db05a32a059634e3710fe79bc14f92f689ca4d4a"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-linux-aarch64.AppImage"
            sha256 "e34a136f1f9a3feabdb5a4ea8f8fba1bb3e5ac54f3962490e7e041fdcf58df5f"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.21.1/pdfcraft-0.21.1-linux-x86_64.AppImage"
            sha256 "730276cda9addb3d48f26c602686d18fc5bc0ebe360a60a2f522d70cfd428d21"
        end
    end

    name "PdfCraft"
    desc "Acrobat-style PDF viewer and editor"
    homepage "https://github.com/storytold/pdfcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/pdfcraft",
        "~/.local/share/pdfcraft",
        "~/.cache/pdfcraft",
    ]
end
