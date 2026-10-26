class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-cli-0.16.0-macos-universal.zip"
        sha256 "ecc6e0aee7990538c99dfcccee989066777ec16cb90d6b2c9e5b136e5c60ae92"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "9b998376a4876a620842f0456f79695b147950d6f173930ee4d5da751303e10b"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.16.0/photocraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "7c17f3633ebf7dabf27628e2d2637d918c7c2a5b163b8b90347a78acddf63608"
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
