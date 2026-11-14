cask "cadcraft" do
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-0.20.1-macos-universal.dmg"
        sha256 "c9ef1cf02234e6a5e854287a64fe314ad6d53227915c3c6664fa4161e2a1fe70"
        app "CADCraft.app"
        zap trash: [
            "~/Library/Application Support/CADCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-0.20.1-linux-aarch64.AppImage"
            sha256 "9c725b9d8a4d2b09bad06175c51cbba4f95b718b6c70c3de35faa4a007e4a921"
            app_image "cadcraft-0.20.1-linux-aarch64.AppImage", target: "CADCraft.AppImage"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.20.1/cadcraft-0.20.1-linux-x86_64.AppImage"
            sha256 "e7a5d244500fe45ccabfa85c632c25ecda1fb03799c318d9ad541f65b150e78f"
            app_image "cadcraft-0.20.1-linux-x86_64.AppImage", target: "CADCraft.AppImage"
        end
        zap trash: [
            "~/.config/cadcraft",
            "~/.cache/cadcraft-control-*.token",
        ]
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
