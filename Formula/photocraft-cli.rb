class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    name "PhotoCraft CLI"
    version "0.8.2"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-cli-0.8.2-macos-universal.zip"
        sha256 "38fd0463f20bc6600aac75ad5e9dd5ec4c35ef23b1dd86ea18a390580c074eac"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-0.8.2-linux-aarch64.tar.gz"
            sha256 "f3920f31406574d1d3f9ca152d46703c8e7f3b504e0d2b2e394f0ad10f0df348"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.8.2/photocraft-0.8.2-linux-x86_64.tar.gz"
            sha256 "16c3089976eee2d290dbe73986db4835c1ec5a043c5c16b017b24848ff5ea827"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to photocraft-cli-0.8.2-macos-universal/; install just the binary.
            bin.install "photocraft-cli-0.8.2-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "photocraft-0.8.2-linux-aarch64/bin/#{name}"
        else
            bin.install "photocraft-0.8.2-linux-x86_64/bin/#{name}"
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
