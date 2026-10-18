cask "lightcraft" do
    version "0.9.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-0.9.1-macos-universal.dmg"
        sha256 "5e3fde7755d0fd0fa91114fc58ef51093a81b6177dcd9aece0142b4ec10e1c5a"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-0.9.1-linux-aarch64.AppImage"
            sha256 "f236c2b9f703bcb0f1c7eef198d36c8970886659ee2d622958b76bc3d409151f"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.9.1/lightcraft-0.9.1-linux-x86_64.AppImage"
            sha256 "bd002851a9524349c9d8922ae2b85c98c257de16480d3b7f885801a3b64b6d18"
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
