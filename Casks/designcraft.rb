cask "designcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-macos-universal.dmg"
        sha256 "14d020b90df9178de290d624e012bdceb353b1595ff5b7991d4896b8f42ea03b"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "8adb8671fd3c5f02551d6a54b83c2fa85b2333a45cd2d017d68d5ad782d0c299"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "8d7661b98f6434d5c65e5cd2c7699d4af6a88d104598c48dcb09bfae05f6c62f"
        end
    end

    name "DesignCraft"
    desc "InDesign-style page layout application"
    homepage "https://github.com/storytold/designcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/designcraft",
        "~/.local/share/designcraft",
        "~/.cache/designcraft",
    ]
end
