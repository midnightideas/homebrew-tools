class EffectcraftCli < Formula
    desc "After Effects-style motion graphics and compositing (CLI)."
    homepage "https://github.com/storytold/effectcraft"
    version "0.14.0"

    on_macos do
        url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-cli-0.14.0-macos-universal.zip"
        sha256 "e32f4c5b735d2573ce5ddbc831ed9c96fdb22f7c56a484f2e0ddd31fc24d84fe"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-0.14.0-linux-aarch64.tar.gz"
            sha256 "000938d39fe2e9f9f68b3adc61fed537f004ff5defb68e82a9c3c5b2c7f8714d"
        else
            url "https://github.com/storytold/effectcraft/releases/download/v0.14.0/effectcraft-0.14.0-linux-x86_64.tar.gz"
            sha256 "7f464e4cedcda418f8b84063c5b3a79bdf59a8a6c0a4e229bf7aaaf052a5d9a7"
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
