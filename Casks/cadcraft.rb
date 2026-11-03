cask "cadcraft" do
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-macos-universal.dmg"
        sha256 "15619c88a1bb7e0149f03e770691ccbf1f479e05dd1ff6f75f416d61e55b1bd9"
        app "CADCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-linux-aarch64.AppImage"
            sha256 "61fbfd91f508e195150767a01099fef118ea7f474d29d177799bc70e9de1fb99"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.17.0/cadcraft-0.17.0-linux-x86_64.AppImage"
            sha256 "0d1a8e9aa7987b95406d0972475d4fae8efd22ae4deedfbb3a9dce26c17443ec"
        end
    end

    name "CADCraft"
    desc "AutoCAD-style 2D/3D CAD application"
    homepage "https://github.com/storytold/cadcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/cadcraft",
        "~/.local/share/cadcraft",
        "~/.cache/cadcraft",
    ]
end
