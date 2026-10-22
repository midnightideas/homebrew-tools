class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-cli-0.9.0-macos-universal.zip"
        sha256 "95589286450b7398b883f3dbee0fb6ac43ebd65968e043dd53ee9e00344bd3ed"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "849a72fe8c9b8d7b274080ece41ff6955bf40279390671c43e883489e34d8cd9"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.9.0/figcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "67f786c816c255598bc120a150ac57cb5a8f246935d29fe8b4d2afa08f88330c"
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
