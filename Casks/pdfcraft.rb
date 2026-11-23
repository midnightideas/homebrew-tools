cask "pdfcraft" do
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-0.22.0-macos-universal.dmg"
        sha256 "ad45ca52a793c7cda1bae1acb6757b5ee12f07bfaec22ce4344e5e5460340634"
        app "PdfCraft.app"
        zap trash: [
            "~/Library/Application Support/PdfCraft",
            "~/Library/Caches/PdfCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-0.22.0-linux-aarch64.AppImage"
            sha256 "7ede1c280a5b27e9ae32523fe79de4aeb7d8f42f15fbc8b8569719ddbef9fa9d"
            app_image "pdfcraft-0.22.0-linux-aarch64.AppImage", target: "PdfCraft.AppImage"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.22.0/pdfcraft-0.22.0-linux-x86_64.AppImage"
            sha256 "771f61b07aaf8cc17e73cb1f93fbe88526f27b0aa82ff32d0710e2c375f49248"
            app_image "pdfcraft-0.22.0-linux-x86_64.AppImage", target: "PdfCraft.AppImage"
        end
        zap trash: [
            "~/.config/pdfcraft",
            "~/.local/share/pdfcraft",
            "~/.cache/pdfcraft",
        ]
    end

    name "PdfCraft"
    desc "Acrobat-style PDF viewer and editor"
    homepage "https://github.com/storytold/pdfcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
