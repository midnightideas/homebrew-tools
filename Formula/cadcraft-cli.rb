class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-cli-0.13.0-macos-universal.zip"
        sha256 "a25833d0c3124d3deae2a1074116ebe82bffe0804faade802367ed09698e9476"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "f1c729e2e11a7bbb857a4289e22bdb874cdccee90b4153fc2194b16acc7a34e4"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.13.0/cadcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "d38755beb61889756bebd938df491e6ee0de78c2f35fd35105a479909fd1ca92"
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
