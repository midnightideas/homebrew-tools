class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-cli-0.17.1-macos-universal.zip"
        sha256 "1634dd1c63aff8fcc5704b168642be8173cc0dda631da7e4ec985a5094833af8"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-0.17.1-linux-aarch64.tar.gz"
            sha256 "c0a03f2c2cce9e0063702b44867c73eafdd45596caaabd8e2d0899f17984eba2"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.17.1/soundcraft-0.17.1-linux-x86_64.tar.gz"
            sha256 "e7ac140bb9fd69ade4dd02643af8e5d4c14a5c82cd670b2030e52688febb3cb4"
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
