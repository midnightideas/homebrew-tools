cask "designcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-0.11.0-macos-universal.dmg"
        sha256 "98b3a37c98be502488655d8e382dad1ea3cf81cdf3f78e1e69a6d1739457ae36"
        app "DesignCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "494cb3b69fbe0ef695673464781542baece8befe2c8d1df8ec500114931dc550"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.11.0/designcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "7e246a6f793719c9818e9d1497efec5e22308c91e42ff3b1fe5f3667ae3a6b8c"
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
