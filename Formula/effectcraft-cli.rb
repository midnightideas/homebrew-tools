class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.11.1"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-cli-0.11.1-macos-universal.zip"
        sha256 "8eae2e1e9c13e03d1bc2460501a90d43fc570b37e9b386294c0720eb12aad0f0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-linux-aarch64.tar.gz"
            sha256 "ee5047d0f6c3ab5fc613c1984ade8621d56291ac24a342b3358a6c54cec433fb"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.11.1/effectcraft-0.11.1-linux-x86_64.tar.gz"
            sha256 "b9cb2ce68dd66458cc164437e431376e94e38e33e3b6529fa8fd45f8cf968934"
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
