class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.21.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-cli-0.21.0-macos-universal.zip"
        sha256 "17199a41ea53abb023b16ef34dd7908d0e4f317af73c488a7000f812a07df802"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-0.21.0-linux-aarch64.tar.gz"
            sha256 "748dce025c14b0bc162edae6b38b5fb552f8d248417544fcc3ac43d65d6d5cb9"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.21.0/photocraft-0.21.0-linux-x86_64.tar.gz"
            sha256 "3115e56cc646dbad3541e39b6323b8a24318fee6194d784ddf6d065f7b5d2d37"
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
