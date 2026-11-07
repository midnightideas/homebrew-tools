cask "vectorcraft" do
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-macos-universal.dmg"
        sha256 "29eace31f0f1472f87d35d7f90bb09b8374413c4ac1adfb1f537431dc148fb60"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-linux-aarch64.AppImage"
            sha256 "30774df9c03fc76b6ad4adfbf2e2433351c4f3711caf6956620996d0bdfad0b9"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-linux-x86_64.AppImage"
            sha256 "09a68d22232530219c12643bb7e9eda6b1f6778cbf9f2f2fc46ff96e2259f7b0"
        end
    end

    name "VectorCraft"
    desc "Illustrator-style vector editor"
    homepage "https://github.com/storytold/vectorcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/vectorcraft",
        "~/.local/share/vectorcraft",
        "~/.cache/vectorcraft",
    ]
end
