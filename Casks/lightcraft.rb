cask "lightcraft" do
    version "0.18.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-0.18.1-macos-universal.dmg"
        sha256 "055348c8098e6244e43cbc2526e9158726746d467f919dae336848db7bb6dbf9"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-0.18.1-linux-aarch64.AppImage"
            sha256 "52a7c6e43abef434ecfd975a9a3b7f8182cc361d9b6ea182630e566dcbb4a8be"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.18.1/lightcraft-0.18.1-linux-x86_64.AppImage"
            sha256 "346cf84c262322934b4a8bbee9fbd7db38f15917c93f2dd0409792d11bfa7db0"
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
