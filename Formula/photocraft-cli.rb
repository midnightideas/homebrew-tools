class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-cli-0.10.0-macos-universal.zip"
        sha256 "57b2bfa6514beb9f85177fbb6832f8aa3aebee08561d78d54a3182c404220927"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "829780d331e6443ddf1bada932ed07e0e9dc541b213b275f3c3a3209607bc7c7"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.10.0/photocraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "c5d455785d9c2eaf695bf8e6327c4d6d23a39ddb956a6114f0c5b64326f984e1"
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
