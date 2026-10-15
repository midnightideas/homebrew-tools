class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-cli-0.10.0-macos-universal.zip"
        sha256 "5da3adb581f0cd49edaa9ae2eeeaa50426cb1afbb0794902551db3d7173dd12a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "967be5222b2e5480b7b1a0743e47379a0fa0ef018017ce31b2eda45046af019b"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.10.0/effectcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "76fbfc0a9ad34399701a18efeb1c178557d01d0a0f4b403514f2dac5d887572e"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to effectcraft-cli-0.10.0-macos-universal/; install just the binary.
            bin.install "effectcraft-cli-0.10.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "effectcraft-0.10.0-linux-aarch64/bin/#{name}"
        else
            bin.install "effectcraft-0.10.0-linux-x86_64/bin/#{name}"
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
