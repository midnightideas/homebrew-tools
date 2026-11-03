class FigcraftCli < Formula
    desc "Figma-style collaborative design and prototyping tool (CLI)."
    homepage "https://github.com/storytold/figcraft"
    version "0.15.0"

    on_macos do
        url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-cli-0.15.0-macos-universal.zip"
        sha256 "fcf727187e237bcc453723e2fc45c1264b8f800c9b55ca75d0666daf93f2e6da"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-0.15.0-linux-aarch64.tar.gz"
            sha256 "cb483aaed6df57107c2b293484b0cb4192d841d7df2a26b39a76cf3e81a8727c"
        else
            url "https://github.com/storytold/figcraft/releases/download/v0.15.0/figcraft-0.15.0-linux-x86_64.tar.gz"
            sha256 "1e5e8e0b9b4a1811f31ce8204a9bc53c851f208b6fe45e0287302f70bc6a08d6"
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
