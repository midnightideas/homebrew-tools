class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-cli-0.19.0-macos-universal.zip"
        sha256 "69f321313156728d4a372579dac9b443bc2f9494d3824d3186f536c98aa4388c"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "5948e8f10c3c020aa8c8803f1a9038a2ffb4dda8ebb1b129881c8a416b2d48ae"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.19.0/photocraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "123385b1730ace18f12bc0f494606e6a4cd3f4ab891f93036cd4e71b8aea70f7"
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
