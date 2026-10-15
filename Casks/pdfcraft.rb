cask "pdfcraft" do
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-0.8.0-macos-universal.dmg"
        sha256 "65f727c221d5b38bcddc94ea64db6c490b0b320ecab81088a4d32496e1feab07"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-0.8.0-linux-aarch64.AppImage"
            sha256 "97dfb26265c10d0dd2dd66827f77a8ebcd421daf11106b2d672b16efb86eb0c8"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.8.0/pdfcraft-0.8.0-linux-x86_64.AppImage"
            sha256 "6b89397ec10ad505e732f18982b6ad171aab085d938ca0c3034a00d4199e38f7"
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
