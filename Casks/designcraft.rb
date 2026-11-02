cask "designcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-0.16.0-macos-universal.dmg"
        sha256 "ee6dbd4991f6365e242c9eda4d5a388536702c7d90ea8e04687a77ca1d1e742b"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "4401ebc210aeea81055c02afe529e032af296cfc53fd2e3d7e4499365cc156f7"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.16.0/designcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "ecccda5dc38c6ca5de192e450f1bfa5393b43bd683868b0e5306ae2dc975c827"
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
