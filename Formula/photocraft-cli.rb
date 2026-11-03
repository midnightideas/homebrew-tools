class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-cli-0.20.1-macos-universal.zip"
        sha256 "e006ef0ae3ca46cbf55c1235a7105f896750373e4f87bc2ae875ad822c994d5d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-linux-aarch64.tar.gz"
            sha256 "ec07b36b48063ca30db0c9043adf86f752255b9800dfe93bf2c6c3fcc9688588"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.20.1/photocraft-0.20.1-linux-x86_64.tar.gz"
            sha256 "398787d58fe46919e99c9f56e35545549ef0aaab007f869a92beff7d9fe52234"
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
