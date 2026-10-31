cask "genoffice" do
    version "0.12.446"

    on_macos do
        on_arm do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.446/GenOffice-0.12.446-arm64.dmg"
            sha256 "277b2de8909484dd960131d373330f129e27654570fd6b405a041c3ec7c4390a"
        end
        on_intel do
            url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.446/GenOffice-0.12.446.dmg"
            sha256 "4f22527b5eb944a8b733806a4336d0af5c90ac7f8b7bc60077f68c70c1814779"
        end
        app "GenOffice.app"
    end

    on_linux do
        depends_on arch: :x86_64
        url "https://github.com/genspark-ai/genoffice/releases/download/v0.12.446/GenOffice-0.12.446.AppImage"
        sha256 "07bec61731880e7e2811593303dafb62654e0ec0237ca0bc30e70abfdb880854"
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
