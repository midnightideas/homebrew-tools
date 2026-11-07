class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-cli-0.22.0-macos-universal.zip"
        sha256 "2cdd28b03166b6ba7e364e886b3d29696e68d70dbca86b70b3922bfe4d2cda6e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-0.22.0-linux-aarch64.tar.gz"
            sha256 "b3cf2810bfbacf066d5e1cd5224328d0a03542e0483c0d6632425e73eb340ba7"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.22.0/effectcraft-0.22.0-linux-x86_64.tar.gz"
            sha256 "5fe9b0ae5746ac29b61f7dea10bd67b71e996c1e0188824c4f81a96623c3bee9"
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
