cask "lightcraft" do
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-0.15.0-macos-universal.dmg"
        sha256 "175c1e68187d91cf90033a93015fb4cb450455755b78f41e394a9ea09e77cde9"
        app "LightCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-0.15.0-linux-aarch64.AppImage"
            sha256 "17b54138c11b47815580e19ea5128f41a81e33d98b7c97c29a8108b9fc8a2919"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.15.0/lightcraft-0.15.0-linux-x86_64.AppImage"
            sha256 "851f1c1554fda928fe433e9cbe0e139a393231565561c2e5152b720bb059813b"
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
