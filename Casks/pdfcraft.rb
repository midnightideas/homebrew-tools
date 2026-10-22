cask "pdfcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-0.11.0-macos-universal.dmg"
        sha256 "8774df32a4ddc356029b133d7d860ed4723c968b8b018e2062b39da0fb05e752"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "988cffd850088b1b2b792bb8b52ca4adc453c3eb84d8ce7d2ffe13c12ac23813"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.11.0/pdfcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "d85810e236f095aa900af20e0276793b28435726cabdd4e21f34ad1049d3cc32"
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
