class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.20.2"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-cli-0.20.2-macos-universal.zip"
        sha256 "25f90078e0a3201ac4bd7778bbb4f6de1f2b67357c98e1cc54052d6240eaaa35"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-0.20.2-linux-aarch64.tar.gz"
            sha256 "a1c3761d132d9ec162691d50f06ed98473bcdc0aed7c171a097df9adcfc38072"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.20.2/photocraft-0.20.2-linux-x86_64.tar.gz"
            sha256 "09e013d68d8313eb0b1cd6f24612f5b5fd0d993fffe3a7c12cecdfe5cd131a46"
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
