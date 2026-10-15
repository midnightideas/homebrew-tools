class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-cli-0.9.0-macos-universal.zip"
        sha256 "eaa662e0eef8f1aa27fa7c4aebdc242f6e2834f1eef62eb2589ddadede128982"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "c956084444653142dd25274cff08dbc17e8bf99815380db7f64eec026e882fc7"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.9.0/photocraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "91300c1485ad710839604b085531c90e77ac7ebdb2a30259309ad74afcfdb90d"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to photocraft-cli-0.9.0-macos-universal/; install just the binary.
            bin.install "photocraft-cli-0.9.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "photocraft-0.9.0-linux-aarch64/bin/#{name}"
        else
            bin.install "photocraft-0.9.0-linux-x86_64/bin/#{name}"
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
