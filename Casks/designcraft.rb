cask "designcraft" do
    version "0.15.2"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-macos-universal.dmg"
        sha256 "efd30a64b36bf02cff8687aa234569217bf0936187dc81717e22f04ca5c24b9d"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-linux-aarch64.AppImage"
            sha256 "eb5f12fc228d38c1aca7d2d579b715288509cf51e57d0ca88873ef1212a741e3"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.15.2/designcraft-0.15.2-linux-x86_64.AppImage"
            sha256 "6d46e10f8e7c2746b6daa4c565c6c6a85329c1e6192e0aa0bbf526ba91a3efa0"
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
