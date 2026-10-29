cask "designcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-0.14.0-macos-universal.dmg"
        sha256 "9392fb563de06da2eca48791a40f812f721103697362015659b3ff7577e7b081"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "aa342edb6543487290e81a63d61fd3c31fc038875f77e2c786d84419cb45d045"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.14.0/designcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "c7b9a4b760e4c94b05fde4cd1c266823a736bc3fa507150cff0dc1920edfc28e"
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
