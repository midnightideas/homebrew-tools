cask "genoffice" do
    version "0.13.615"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.615/GenOffice-0.13.615-arm64.dmg"
            sha256 "9ef7cad7bdb2c67925c5d46c783ac19cdc18560a7350f399d5cc22029a7dfe7e"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.615/GenOffice-0.13.615.dmg"
            sha256 "53346e96607d40026ede61682af255349815d6283afe50a25b85b97082b1ac1c"
        end
        app "GenOffice.app"
        zap trash: [
            "~/Library/Application Support/GenOffice",
            "~/Library/Caches/GenOffice",
            "~/Library/Preferences/com.genoffice.app.plist",
        ]
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.13.615/GenOffice-0.13.615.AppImage"
        sha256 "78b9cee9040ee19be233821b025ea28e0d565628f2f50a0abb5888c71dee8ca6"
        app_image "GenOffice-0.13.615.AppImage", target: "GenOffice.AppImage"
        zap trash: [
            "~/.config/GenOffice",
            "~/.cache/GenOffice",
        ]
    end

    name "GenOffice"
    desc "Open-source AI office suite for docs, sheets, slides, and PDF"
    homepage "https://genoffice.ai/"

    livecheck do
        url :url
        strategy :github_latest
    end
end
