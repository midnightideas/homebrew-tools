cask "photocraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-0.14.0-macos-universal.dmg"
        sha256 "b1b81f1d4b433578e6b9d2b9800e18d8e5fb60ebbc38977918d3529d1bdb140a"
        app "PhotoCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-0.14.0-linux-aarch64.AppImage"
            sha256 "e862fbcb8877b5635d35796a315edbf9b8bd90a1ceb524357c0800c58cde8f1a"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-0.14.0-linux-x86_64.AppImage"
            sha256 "62d319592159f8e6909e252151196d23d9b7a243fc9f9095e5adf8ecbac9f03c"
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
