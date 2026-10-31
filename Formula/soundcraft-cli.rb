class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-cli-0.15.0-macos-universal.zip"
        sha256 "b9a7d2db129b77e9e254a813225f935d8e0aa032443c70c10af054dd6b1827b2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "595cfe17b14e6c39866f55cda38e5eb84a12cc181aec74942d81b4e3fb52f9ea"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "16ef23ef62ec20f5fcc53e04abaaff527095e505f5608b47ab1b72b1c8e9ed20"
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
