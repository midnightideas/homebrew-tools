class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-cli-0.17.0-macos-universal.zip"
        sha256 "6edff99cc1977508bea9b5566f551374e7b8ef42a21502ee084a1d969f0d54c0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "a9478dee2b34f270a1f845a7d7f4da501c529d443680ee23c2c8b588867d61b8"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.17.0/photocraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "5259f9c428c8ee3478c35500ece98713561cafc050e4c9eb354a5050f36eb2b8"
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
