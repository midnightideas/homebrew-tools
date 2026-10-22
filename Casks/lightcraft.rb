cask "lightcraft" do
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-0.11.0-macos-universal.dmg"
        sha256 "09a0dd5a9d42e6b607ac57789d6a1b9cf8f58d9a670bb671df9ba7809f64e708"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-0.11.0-linux-aarch64.AppImage"
            sha256 "26f776a50c6928429af74db2cf751d36673a19b7fad8baed324e1cb8be1812bd"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-0.11.0-linux-x86_64.AppImage"
            sha256 "3a1ea99e4a806a5bab7fad7ea6744d467275fa13fce2247161808a2b430e78aa"
        end
    end

    name "LightCraft"
    desc "Lightroom-style photo library and raw development"
    homepage "https://github.com/storytold/lightcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/lightcraft",
        "~/.local/share/lightcraft",
        "~/.cache/lightcraft",
    ]
end
