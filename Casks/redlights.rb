cask "redlights" do
  version "0.4.0"
  sha256 "8b34d56eaa9b982c91dafaab0487f1f1ec66646ff86194ff35ec7bc9851ea58f"

  url "https://github.com/Vasallo94/redlights/releases/download/v#{version}/RedLights-#{version}.zip"
  name "RedLights"
  desc "Menu bar app that turns every display pure red for astronomy"
  homepage "https://github.com/Vasallo94/redlights"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RedLights.app"

  # La app va firmada ad-hoc, sin notarizar: sin esto Gatekeeper la bloquea al abrirla.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RedLights.app"]
  end

  uninstall quit: "es.quique.redlights"

  zap trash: "~/Library/Preferences/es.quique.redlights.plist"
end
