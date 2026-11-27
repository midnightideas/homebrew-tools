class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.25.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-cli-0.25.1-macos-universal.zip"
        sha256 "f498e407a82f6ba08067160025301e64723706efc45c963c495a0f7fed78c8ff"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-0.25.1-linux-aarch64.tar.gz"
            sha256 "a4a96c8db77030ab2b2c2418361aebef44edb29794b5c064b3b8c811e9eaa523"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.25.1/effectcraft-0.25.1-linux-x86_64.tar.gz"
            sha256 "6f29ff7e0359909fe1dbf6fd3cfd8430a0362349b612c5eb2cfc8fee7b9e2760"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
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
