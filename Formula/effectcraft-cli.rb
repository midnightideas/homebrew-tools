class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-cli-0.16.0-macos-universal.zip"
        sha256 "39161cb285bcacb290cb55e195a5b116ab8fc314e5a24280cb1e40ed916d508a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "bf38cec1717b35432d73a6f48cfc075c0d2b110fae357fba5c4242d55c4aae97"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.16.0/effectcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "91b40da9e18be49157467a96db7b2fbf7c20b5182d8c415c59bed51591bc1de0"
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
