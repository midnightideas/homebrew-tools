cask "wordcraft" do
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-0.16.0-macos-universal.dmg"
        sha256 "407cb7ba1495437810bf066d799141e0ab4325406084556be1422368bd08b377"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-0.16.0-linux-aarch64.AppImage"
            sha256 "bc03d28e6aa88413ac28e3a388ed790e543322bb2213abd2236461c1e33df77b"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.16.0/wordcraft-0.16.0-linux-x86_64.AppImage"
            sha256 "980ac1d6918f1c1e0c240d859374f22b19e524d3af3372daef1344c5a097ae17"
        end
    end

    name "WordCraft"
    desc "Word-style word processor for .docx files"
    homepage "https://github.com/storytold/wordcraft"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/.config/wordcraft",
        "~/.local/share/wordcraft",
        "~/.cache/wordcraft",
    ]
end
