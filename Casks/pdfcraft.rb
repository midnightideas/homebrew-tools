cask "pdfcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-macos-universal.dmg"
        sha256 "c7ad794feb3d8b513cdc402d4ead73023b408c423d0818f6492d9cf11f1c0733"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "d60e10f1b9d53ecfbc7a7cdc5c58cabc068cb5c6dad8a8e899c3a31c13f0930e"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.13.0/pdfcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "3fc64ed651db262b994fcd9cc3d5d7bb2e4d4799a4b4a1b38792ddb5fe106c60"
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
