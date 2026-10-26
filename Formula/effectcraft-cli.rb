class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-cli-0.17.0-macos-universal.zip"
        sha256 "e1d163a01c8cba4e5b453d52b3ebf17ae443a7d368cfe669a502511608bcd74a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "6963ed3f1a4bf3ba078c6d57e9893ac9bd557297029aeaeae380f6f5c8555023"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.17.0/effectcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "cd7ace0d74734b79e851f18537c14b2953b7feb5da240f5005e6805476a15292"
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
