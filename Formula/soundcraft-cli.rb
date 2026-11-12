class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.20.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-cli-0.20.1-macos-universal.zip"
        sha256 "866fcbfe32179e6652159385b4f676ba756e1cadb88fac3e9173e9643f763b51"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-0.20.1-linux-aarch64.tar.gz"
            sha256 "93c6c6e5e37c0e57acea76201faacc777ed0f7b8fb8b86baaa71bb55cfd33dfd"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.20.1/soundcraft-0.20.1-linux-x86_64.tar.gz"
            sha256 "caefcf85c4f1138717d592d31ce5be07f2fca616ec36d63fac6760cdefbe28a9"
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
