cask "vectorcraft" do
    version "0.23.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-macos-universal.dmg"
        sha256 "8bee3c5429487e708f95469c6568f750c700f97b86483a6f6cbfd0769b25be1b"
        app "VectorCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-linux-aarch64.AppImage"
            sha256 "2ae656a187f4adaa288c6ebfa6fd7fa66e00db8a51e5797f175f2f2f81701cc7"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.23.0/vectorcraft-0.23.0-linux-x86_64.AppImage"
            sha256 "8a130f448fa8dff0a279dcefca56229f5702cb341123263436d587c45be2a8e4"
        end
    end

    name "VectorCraft"
    desc "Illustrator-style vector editor"
    homepage "https://github.com/storytold/vectorcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/vectorcraft",
        "~/.local/share/vectorcraft",
        "~/.cache/vectorcraft",
    ]
end
