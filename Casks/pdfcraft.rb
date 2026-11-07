cask "pdfcraft" do
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-macos-universal.dmg"
        sha256 "8b41d907b1a030b4ba8df03b5eb969f7090f8f41ece23bcb799077f208a10c96"
        app "PdfCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-linux-aarch64.AppImage"
            sha256 "9d51f26b59707c5442c83ec3796eb3387b9ee93b8dfefb3c3404fef5212aaadc"
        else
            url "https://github.com/storytold/pdfcraft/releases/download/v0.19.0/pdfcraft-0.19.0-linux-x86_64.AppImage"
            sha256 "7d6f5875a4d68cf1fd2be8db9f3053142c2507350c17f1841230ef26c22c0b36"
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
