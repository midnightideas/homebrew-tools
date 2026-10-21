class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-cli-0.11.1-macos-universal.zip"
        sha256 "11f870cd6773092f446fc7ce58a366e54ac9190e91a3ad197deec49335b20b64"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-0.11.1-linux-aarch64.tar.gz"
            sha256 "df997e03aa7512fe3ca42c2a89108bb5a4ed2becf594023d486a8ef9f099399c"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.11.1/photocraft-0.11.1-linux-x86_64.tar.gz"
            sha256 "0e1499b499b8bd80a9638e315c0f1c927d0606ac5cd58bfbda434f5025c80a49"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
        elsif Hardware::CPU.arm?
            bin.install "bin/#{name}"
        else
            bin.install "bin/#{name}"
        end
    end

    test do
        assert_predicate bin/"#{name}", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
