cask "pdfcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-0.17.0-macos-universal.dmg"
        sha256 "90aec2859024f27e1095ecf8bb250a9bc0251f900ba0ab5cd194d10557c8a712"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "250c427d5f50321b8453df397bc76d4ecd53cdc03813f0268b6ce8f7b431a05f"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.17.0/pdfcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "9337e5702ee6459d8bcda9876c3ae3c9725af38c744096dbc070d7cfae244586"
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
