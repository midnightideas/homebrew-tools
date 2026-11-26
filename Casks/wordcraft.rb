cask "wordcraft" do
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-0.19.1-macos-universal.dmg"
        sha256 "df13cabf63bb2591045ebf6782c17440e7ecee9556550d6dd2affecd983825b2"
        app "WordCraft.app"
        zap trash: [
            "~/Library/Application Support/WordCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-0.19.1-linux-aarch64.AppImage"
            sha256 "ef5e893a9394d03136fe887c0563e795a1384289c75f3bf50095b2a0048d208c"
            app_image "wordcraft-0.19.1-linux-aarch64.AppImage", target: "WordCraft.AppImage"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.19.1/wordcraft-0.19.1-linux-x86_64.AppImage"
            sha256 "10176ffa8b8b4e0d298516c656b201959bb8280444f059d7b8838b6a691590de"
            app_image "wordcraft-0.19.1-linux-x86_64.AppImage", target: "WordCraft.AppImage"
        end
        zap trash: [
            "~/.config/wordcraft",
            "~/.local/share/wordcraft",
        ]
    end

    name "WordCraft"
    desc "Word-style word processor for .docx files"
    homepage "https://github.com/storytold/wordcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
