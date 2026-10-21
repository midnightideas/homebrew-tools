cask "designcraft" do
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-0.10.0-macos-universal.dmg"
        sha256 "5239413e77ede3696e7a4a53b63b384e58976c7c503998cadfd5c93d07c576a6"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-0.10.0-linux-aarch64.AppImage"
            sha256 "a7640a58579575672c1bcc7bf79fb57a1fb28df37d47958ea53756cebc719d22"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.10.0/designcraft-0.10.0-linux-x86_64.AppImage"
            sha256 "0e2c3dee2a5abe9afc4dcbe1ec0438cc60544ce1d18bf1f5c3e1690e129cd957"
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
