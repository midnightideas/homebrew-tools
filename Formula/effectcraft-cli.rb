class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-cli-0.19.0-macos-universal.zip"
        sha256 "6212496ea0f208225ff09385e6d4ac95275be679b6ef61844040d9760bba13ba"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "925737425d273b9445c3864b4dcba11726da88657cab20c2eb616920b27efac6"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.19.0/effectcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "7ec9391dae775f7ce7e7291268f7b1233228c1bade83ced8840303535c951970"
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
