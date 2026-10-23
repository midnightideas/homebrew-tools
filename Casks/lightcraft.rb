cask "lightcraft" do
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-0.13.0-macos-universal.dmg"
        sha256 "9a1a9b5d8e9af96101d3299650d014d094c51d8ea8fe5e39bae83fa5a9189de0"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-0.13.0-linux-aarch64.AppImage"
            sha256 "46f12993371118f4158c4b19ff6f01e1ffdc2cf8049bea2dd9e36f8185333382"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.13.0/lightcraft-0.13.0-linux-x86_64.AppImage"
            sha256 "07ef0c639bd211c1cba252e6803953c1d99462f55b561d30bf9bd7ac4a4e7d7b"
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
