class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-cli-0.22.0-macos-universal.zip"
        sha256 "60e5bf1e689e58a800763867fbed193b7297d6366bbece57b6b78abd9ada875b"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-0.22.0-linux-aarch64.tar.gz"
            sha256 "117d5ba6d4a52cbe2d284c78a682da420063a7b4600dab332545b2bb7239a36a"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.22.0/photocraft-0.22.0-linux-x86_64.tar.gz"
            sha256 "eedeafa4675dfbd1f2351e6bfa4b82f54453694eb36da1bbd5ca8bbf5f54f202"
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
