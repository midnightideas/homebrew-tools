cask "pdfcraft" do
    version "0.20.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-0.20.0-macos-universal.dmg"
        sha256 "f44bea1466fcb6902effbad7e824fe59a70077c73ebd977e14e166585c447ce6"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-0.20.0-linux-aarch64.AppImage"
            sha256 "bbd80a80be5fbee7d602f3b64d9263d8a6ffeba6a99f40ed88204ff6bc1653c3"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.20.0/pdfcraft-0.20.0-linux-x86_64.AppImage"
            sha256 "027e62299b82353600373e6ca74c441213ef5406e70d27f7f1aef7e05a78878d"
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
