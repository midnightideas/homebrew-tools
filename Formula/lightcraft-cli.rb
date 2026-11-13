class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-cli-0.21.1-macos-universal.zip"
        sha256 "58086b9d224d02b5ec9ed08e76da04ba1dc5d51d3c285cdea417358fa7ea06e2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-0.21.1-linux-aarch64.tar.gz"
            sha256 "ae8c557ef7028cbfaefe105c27c30cef9490d25c199803c3f1cbe072bc39d7b6"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.21.1/lightcraft-0.21.1-linux-x86_64.tar.gz"
            sha256 "b123de16915809a79e64ba4ee3aee9e1cded6ef23b737c06f81cdc7e2f286d62"
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
