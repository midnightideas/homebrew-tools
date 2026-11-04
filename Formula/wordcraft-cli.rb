class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.15.1"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-cli-0.15.1-macos-universal.zip"
        sha256 "885749231387a8e8212b5c6747d432cf83c49b227d7021ff97f32b4740102174"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-0.15.1-linux-aarch64.tar.gz"
            sha256 "1d114f7b670178a1e5bf027980dab0d4f9c1295a2eeffd0b7adb1458cea409a8"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.15.1/wordcraft-0.15.1-linux-x86_64.tar.gz"
            sha256 "8c6fca3809ea1ac8168c4d7d9392cade84a50f54018be1f88121ba4ecc04a552"
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
