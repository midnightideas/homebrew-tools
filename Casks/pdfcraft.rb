cask "pdfcraft" do
    version "0.18.2"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-0.18.2-macos-universal.dmg"
        sha256 "79d62c11f4c28d5447cee3a5163c1dbf04df240a08640237f3850bb726dd28a7"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-0.18.2-linux-aarch64.AppImage"
            sha256 "fd4846be94442b86a8e63fb97c99b136b34928fbf2acb6c5ecf9ab307982cbf2"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.2/pdfcraft-0.18.2-linux-x86_64.AppImage"
            sha256 "bedb1f8173e7eb9fa1d5800b65b41ed3b5a57ad93e5661c6a921a2a450242291"
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
