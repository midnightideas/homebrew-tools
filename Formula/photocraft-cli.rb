class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-cli-0.15.1-macos-universal.zip"
        sha256 "fe86eb4fc52c926b1b33301705c496df1767580f2ac5d241992de14a6f437511"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-0.15.1-linux-aarch64.tar.gz"
            sha256 "ff2ea1945df3b413b17c64ec7c0131c093b09c717994a47b4c46c0dabf1c822f"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.15.1/photocraft-0.15.1-linux-x86_64.tar.gz"
            sha256 "b622be40355513056f8152afe895d0a05c1bc3c344a027f772a9a12fa3d1c223"
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
