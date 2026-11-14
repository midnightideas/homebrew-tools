cask "photocraft" do
    version "0.23.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-macos-universal.dmg"
        sha256 "606a52917188c65dc71709781180a0e3244e0f3b7f40b2f5b80170e87364420d"
        app "PhotoCraft.app"
        zap trash: [
            "~/Library/Application Support/Photocraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-linux-aarch64.AppImage"
            sha256 "e43d4debbe66cf0ea27626097f2756848176a5540a3de59252c85dd3c7698246"
            app_image "photocraft-0.23.1-linux-aarch64.AppImage", target: "PhotoCraft.AppImage"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-linux-x86_64.AppImage"
            sha256 "05747b3e527e1e0a0c1de39970361cf38c8fca7e8d3e3601ef2082fb0e6dd17f"
            app_image "photocraft-0.23.1-linux-x86_64.AppImage", target: "PhotoCraft.AppImage"
        end
        zap trash: [
            "~/.config/photocraft",
            "~/.local/state/photocraft",
            "~/.local/share/applications/ai.storyteller.photocraft.desktop",
            "~/.local/share/icons/hicolor/*/apps/ai.storyteller.photocraft.*",
        ]
    end

    name "PhotoCraft"
    desc "Photoshop-style raster image editor"
    homepage "https://github.com/storytold/photocraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
