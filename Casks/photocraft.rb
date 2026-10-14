cask "photocraft" do
    version "0.8.2"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-0.8.2-macos-universal.dmg"
        sha256 "d31fe9f86b521319e412515c5313a56dfa7ca015203e2cbaf49a5b1ddb59a601"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-0.8.2-linux-aarch64.AppImage"
            sha256 "d387c94d03870f09fe2e35b9aefd88cb65408d2d0fd891e3a8c63e030cf21cd3"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-0.8.2-linux-x86_64.AppImage"
            sha256 "5eb656de686af504d8160d5198c2c8d414cf8b7a8d3ecc636bc8ba8fb56448a7"
        end
    end

    name "PhotoCraft"
    desc "Photoshop-style raster image editor"
    homepage "https://github.com/storytold/photocraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/photocraft",
        "~/.local/share/photocraft",
        "~/.cache/photocraft",
    ]
end
