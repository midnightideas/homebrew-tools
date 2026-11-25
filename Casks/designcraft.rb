cask "designcraft" do
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-0.21.1-macos-universal.dmg"
        sha256 "9964d13556c7e0f03abf6f4ab20bde8a9d6c9db744d4d3cc6c67753862064f00"
        app "DesignCraft.app"
        zap trash: [
            "~/Library/Application Support/DesignCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-0.21.1-linux-aarch64.AppImage"
            sha256 "513bef6d184c2e78330d26490be7f7c495504caaf88fa8b61490192a8fb03e79"
            app_image "designcraft-0.21.1-linux-aarch64.AppImage", target: "DesignCraft.AppImage"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.21.1/designcraft-0.21.1-linux-x86_64.AppImage"
            sha256 "bb08f639ca036da0d271aca1f1f4c9bd711415c4f7e085bc1bf42d7b1f6e0c03"
            app_image "designcraft-0.21.1-linux-x86_64.AppImage", target: "DesignCraft.AppImage"
        end
        zap trash: [
            "~/.config/designcraft",
            "~/.local/share/designcraft",
        ]
    end

    name "DesignCraft"
    desc "InDesign-style page layout application"
    homepage "https://github.com/storytold/designcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
