require_relative "../spec_helper"

RSpec.describe "EduardoKirk user-prompt-submit" do
  context "" do
    it "outputs nothing to stdout and stderr" do
      stdin_data = {
        session_id: "00000000-0000-0000-0000-000000000000",
        transcript_path: Pathname.new(__dir__).to_s,
        cwd: Pathname.getwd.to_s,
        hook_event_name: "UserPromptSubmit",
        prompt: "hello world"
      }

      stdout, stderr, status = Open3.capture3(ENV["EDUARDO_KIRK_PATH"], "user-prompt-submit", stdin_data: stdin_data.to_json)
      expect(stdout).to be_empty
      expect(stderr).to be_empty
    end
  end
end
