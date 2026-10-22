class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.12.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-cli-0.12.0-macos-universal.zip"
        sha256 "9aca69821c1f84a1ebab4b9ee4e86ceba3e995ef8a676b7b4394bfe67486fb0e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-0.12.0-linux-aarch64.tar.gz"
            sha256 "daba522ddac492b96e0c137ce032227cb1ba943f9cc38f323dc373e36f4a470a"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.12.0/photocraft-0.12.0-linux-x86_64.tar.gz"
            sha256 "fb2b830230e3202a1ee18ec20e3f6d250d276b165d78811e83eb6a75725f9ce2"
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
