cask "vectorcraft" do
    version "0.24.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-0.24.1-macos-universal.dmg"
        sha256 "8dee5996b0d95fc0a8bc8b9d95cac24834a623cb08036a0cea8bb6c0e974caad"
        app "VectorCraft.app"
        zap trash: [
            "~/Library/Application Support/VectorCraft",
        ]
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-0.24.1-linux-aarch64.AppImage"
            sha256 "49b71c59f8d99a288eea9e9d6f502bdc72c48dc8b3afd54d00413102dba259e1"
            app_image "vectorcraft-0.24.1-linux-aarch64.AppImage", target: "VectorCraft.AppImage"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.24.1/vectorcraft-0.24.1-linux-x86_64.AppImage"
            sha256 "bdce7e82e981f9f4ed0bf25fa6f25e6fe4fab27e89641e6f948899e01b13a514"
            app_image "vectorcraft-0.24.1-linux-x86_64.AppImage", target: "VectorCraft.AppImage"
        end
        zap trash: [
            "~/.config/vectorcraft",
        ]
    end

    name "VectorCraft"
    desc "Illustrator-style vector editor"
    homepage "https://github.com/storytold/vectorcraft"

    livecheck do
        url :url
        strategy :github_latest
    end
end
