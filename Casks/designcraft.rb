cask "designcraft" do
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-0.9.0-macos-universal.dmg"
        sha256 "7fe7578040fb1b340b063d513b62cf7e53335274453327b287998221bb52768e"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-0.9.0-linux-aarch64.AppImage"
            sha256 "54dd777ae54e2b6d930dc9028465f0bece9a58a904b9e9ce51b8b95407ee52ad"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-0.9.0-linux-x86_64.AppImage"
            sha256 "e5ab60399b923271235940118918d6f0c460a3082a090b0f6fe4d9d0490da9b5"
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
