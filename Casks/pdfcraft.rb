cask "pdfcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-0.14.0-macos-universal.dmg"
        sha256 "f0bddea3f0d711470d95f714b23ccce61c38b2bbcca821d397ce8dbb0564cf74"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "36a572f69da55d0405d2f723b9dd021f3bde849c5739b98edcc350078f26e2a0"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.14.0/pdfcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "a115132eb9aa5eed510a4e85aa5785c81e6690769203415506a1a4b2dd011190"
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
