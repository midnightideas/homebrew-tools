cask "lightcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-macos-universal.dmg"
        sha256 "8ff1a1c3d1a985955cbc6571d1fba88e3754bb0ccce883e832dc2cd3e73a5175"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "ae20d99b432a2623b5dcac0f17287fa230708f52ba78d51551d44a20e9ba1774"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.16.0/lightcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "0ca1e9e585008ca6c0027168abc6df26a1a0cae8b26d73181bb53e2ce32e5d77"
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
