cask "pdfcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-0.9.0-macos-universal.dmg"
        sha256 "116738045a68463eb1a465e6eaef2266902aac69aa1a15e4a1c1472c31d8abe9"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "eaf05dd1c458ce207e9d99fcd75e8a3e0c97136c25fbe7e90a50b86c767b3bbb"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.9.0/pdfcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "f8568c87906d968461052f0b57097c0b84b70b37bf649c9b504d8c1eb7ad0cfa"
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
