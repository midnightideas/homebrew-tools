cask "pdfcraft" do
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-0.18.1-macos-universal.dmg"
        sha256 "55f84be56388d69f24df22522f6d424f8d8e69529db669ce08ea198455e08ceb"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-0.18.1-linux-aarch64.AppImage"
            sha256 "8f30be4362ba5119f6388f948b0b88386977568736ffc8961cf2ceee0b41b2d4"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.18.1/pdfcraft-0.18.1-linux-x86_64.AppImage"
            sha256 "4ce61a8f4f1374591e7468f07a47be542594c1e31d660d9a5d539ddbe85010c6"
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
