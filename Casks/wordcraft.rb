cask "wordcraft" do
    version "0.15.2"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-0.15.2-macos-universal.dmg"
        sha256 "1ce120e09aa842fe24a82f0f0023d850416bc1f0bef6e4848dbfcb69d60ddadf"
        app "WordCraft.app"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-0.15.2-linux-aarch64.AppImage"
            sha256 "75dcdf035f8f533c5165d9e52cc99a09098ea3a4fe5ef38f3b3e4a764a37acf2"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.2/wordcraft-0.15.2-linux-x86_64.AppImage"
            sha256 "74932bc67fe5f5355305a87b79eaed9e5ab836f685e1633af4992161e47f80a4"
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
