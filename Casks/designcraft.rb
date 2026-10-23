cask "designcraft" do
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-0.12.0-macos-universal.dmg"
        sha256 "1e5cdc6c8508a66150c0a7aa68b02a9d78ac32d739d7322d4094217f0574d4de"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-0.12.0-linux-aarch64.AppImage"
            sha256 "7d638a98f96a2ada627c0c3e8d475ce47abdd441f48ec8fc9834202fc372a2fb"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.12.0/designcraft-0.12.0-linux-x86_64.AppImage"
            sha256 "7d76c43f90017e1e83982155bd057864487f4c68ac7cc65731334d90ef51ed9a"
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
