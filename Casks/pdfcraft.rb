cask "pdfcraft" do
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-0.18.0-macos-universal.dmg"
        sha256 "2c7be0e8300e3bad93ccd390eae16ec342bcd935b12dc282fda3f0589bc7ce72"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-0.18.0-linux-aarch64.AppImage"
            sha256 "35dea042a84a0818de2e7611cf24b937d96b64604c0cd7688c0e1841ab34b338"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.0/pdfcraft-0.18.0-linux-x86_64.AppImage"
            sha256 "3fd477e32f20680cf0c2d986425f783a171788869be90be556e5878b5b2318bf"
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
