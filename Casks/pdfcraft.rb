cask "pdfcraft" do
    version "0.16.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-0.16.1-macos-universal.dmg"
        sha256 "1357e6f1cdc1d06ab4ecc253e9c7b31b71e401897b5c781583ccaefd1941642f"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-0.16.1-linux-aarch64.AppImage"
            sha256 "547b89103c6770f2ebe4a52bd2a5aa1667d0724045b400dcd8a9bf0724f1cf4d"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.16.1/pdfcraft-0.16.1-linux-x86_64.AppImage"
            sha256 "2535a68a9c2156946cbc7cd3ffe4704a3d2c840a211ce6cc2d9cea62d36dca53"
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
