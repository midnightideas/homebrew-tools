cask "pdfcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-0.15.0-macos-universal.dmg"
        sha256 "c124fc2ed512765943fb2e8e764bc14c079dc5b7d7a5439ccdb3401df78fd472"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "c43010378f9180887644eaa5ad8cc9ff9168714e0a108f49e62a2c1b7be012a0"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.15.0/pdfcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "7d7771a62a9c81e35b1de286ad38110c85a59a040c12b961f024ee972338d2fe"
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
