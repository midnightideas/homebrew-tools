class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-cli-0.14.0-macos-universal.zip"
        sha256 "2ed3632ca7769ac4002943d311dcee12963d655317e1bff36e50d9421c6ed0b7"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "43e7b4bdd69bc5ad747d1f6161aef6fba4839e7807a86eb0cd1d008897395615"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.14.0/photocraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "3d1f60a76c25aafbf53f23cfedd3687bd99eb6f5309920e140d588bd3212c936"
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
