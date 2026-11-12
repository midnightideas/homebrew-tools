class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.23.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-cli-0.23.1-macos-universal.zip"
        sha256 "a6ecdc6d4add02881642bda0a0b191b4974118651f2ec5641dc71b2c3ff4b752"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-linux-aarch64.tar.gz"
            sha256 "fcc81c38ae62c72fa9f4fd1ec3d18396493ba261662792d6995cc35905ce71d2"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.23.1/photocraft-0.23.1-linux-x86_64.tar.gz"
            sha256 "4383aef67a07cc370ad250a6ed60015205d3e6c463faf3ff4b0f67b8178ccfc8"
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
