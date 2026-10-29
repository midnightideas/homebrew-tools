cask "genoffice" do
    version "0.12.115"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.115/GenOffice-0.12.115-arm64.dmg"
            sha256 "78c77beac2f42ed3dccc1ab855dad0b0d0cdc44f9f9833adbf3bcbaa040ea0dd"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.115/GenOffice-0.12.115.dmg"
            sha256 "0ff9d73b65e7747feaf69dc57679b54400090292bdd68951e7976a0a1c6ba631"
        end
        app "GenOffice.app"
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.115/GenOffice-0.12.115.AppImage"
        sha256 "7750613cde471892a129a586d4ef240f60a8155be0a93a0cf8498af17a539b28"
    end

    name "GenOffice"
    desc "Open-source AI office suite for docs, sheets, slides, and PDF"
    homepage "https://genoffice.ai/"

    livecheck do
        url :url
        strategy :github_latest
    end

    zap trash: [
        "~/Library/Application Support/GenOffice",
        "~/Library/Caches/GenOffice",
        "~/Library/Logs/GenOffice",
        "~/Library/Preferences/com.genoffice.app.plist",
        "~/.config/GenOffice",
        "~/.cache/GenOffice",
        "~/.genoffice",
    ]
end
