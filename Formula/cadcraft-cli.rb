class CadcraftCli < Formula
    desc "AutoCAD-style 2D/3D CAD application (CLI)."
    homepage "https://github.com/storytold/cadcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-cli-0.18.0-macos-universal.zip"
        sha256 "323d276a2693c57ef6d15719aedf64903391d2a309f7cd1332434fa1b9a03e3e"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "4218f2c8c663af4f16d87cbeff741bd97936ec17cb11507a407e8b63b4d6cec7"
        else
            url "https://github.com/storytold/cadcraft/releases/download/v0.18.0/cadcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "0d5b522afcfa20c7e58887c2092fb5ad5322eb90c1da98061e61b7e3acd1bed5"
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
