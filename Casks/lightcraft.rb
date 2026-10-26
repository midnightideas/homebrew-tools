cask "lightcraft" do
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-0.14.0-macos-universal.dmg"
        sha256 "cde8591da93f7b5aa7ad09137cc93c1ebf3b4748fe89e477bb036263d7c93e75"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-0.14.0-linux-aarch64.AppImage"
            sha256 "2f1dad8abb22d472996d087a0a0fc5eee3b70ff9b8d3a36a35abf7245cb1fe3c"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.14.0/lightcraft-0.14.0-linux-x86_64.AppImage"
            sha256 "d6e02cc2da7afb11602f6ec08f0ac8a60d73070a54960680e97b92a0a17d3d77"
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
