class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.13.1"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-cli-0.13.1-macos-universal.zip"
        sha256 "797767770d21ba30d8b2faebf9cab259a8bcfa4eb75f045761a80e22734cdfd2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-linux-aarch64.tar.gz"
            sha256 "0f6320a73fd41fdf9dbf5c069fc93124b9e087141a568577eb5c1b3e31b259ec"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.13.1/soundcraft-0.13.1-linux-x86_64.tar.gz"
            sha256 "09ee6c8845934feef4bbf4c5c0e2f0ffca3fc91126fd7a6a4061b1f83907456d"
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
