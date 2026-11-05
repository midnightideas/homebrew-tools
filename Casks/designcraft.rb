cask "designcraft" do
    version "0.17.2"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-0.17.2-macos-universal.dmg"
        sha256 "4dafd1020e857c20d324d46225537da2dc7a6f91b202ae373ee367ec8c971951"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-0.17.2-linux-aarch64.AppImage"
            sha256 "edd78c5bee9decebdc5338bae89637b958ff5e30dbccb83cf26905ec9d78ea66"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.17.2/designcraft-0.17.2-linux-x86_64.AppImage"
            sha256 "30e9d2a5ab322bee47980010ab68a1681061d9a9700ea989a33da54f0839730f"
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
